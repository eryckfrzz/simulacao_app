import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simulacao_app/detalhes_produtos.dart';
import 'dart:convert';
import 'models/produtos_model.dart';

class Listarprodutos extends StatefulWidget {
  const Listarprodutos({super.key});

  @override
  State<Listarprodutos> createState() => _ListarprodutosState();
}

class _ListarprodutosState extends State<Listarprodutos> {
  int _opcaoSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    Future<List<Produto>?> _getProdutos() async {
      Uri uri = Uri.parse(
          'https://api.json-generator.com/templates/X8-k7KY9_QF0/data?access_token=rjpi25gxvmyv8wdh38cozz14vi7z4ami1ho4yf77');

      var response = await http.get(uri);

      List dados = json.decode(response.body);

      List<Produto> produtos = [];

      dados.forEach((elemento) {
        Produto produto = Produto(
            elemento['produto_id'],
            elemento['produto'],
            elemento['endereco'],
            elemento['descricao'],
            elemento['imagem'],
            int.parse(elemento['quantidade']),
            double.parse(elemento['preco']));

        produtos.add(produto);
      });

      return produtos;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Meus produtos',
              style: TextStyle(fontSize: 20),
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: FutureBuilder(
          future: _getProdutos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(child: Text('Carregando...'));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, indice) {
                    return ListTile(
                      leading: Image.asset('assets/images/produto.png'),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data[indice].produto}',
                            style: TextStyle(fontSize: 25),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'R\$' + '${snapshot.data[indice].preco}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          )
                        ],
                      ),
                      subtitle: Text(snapshot.data[indice].descricao
                              .toString()
                              .substring(0, 30) +
                          '...'),
                      onTap: () {
                        print(
                            'Produto: ${snapshot.data[indice].produto}, Posição: $indice');

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetalhesProdutos(
                                produtoId: snapshot.data[indice].produto_id,
                                produto: snapshot.data[indice].produto,
                                endereco: snapshot.data[indice].endereco,
                                descricao: snapshot.data[indice].descricao,
                                preco: snapshot.data[indice].preco,
                              );
                            },
                          ),
                        );
                      },
                    );
                  });
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.green,
            unselectedItemColor: Colors.black,
            fixedColor: Colors.white,
            currentIndex: _opcaoSelecionada,
            onTap: (opcao) {
              setState(() {
                _opcaoSelecionada = opcao;
              });

              if (_opcaoSelecionada == 1) {
                Navigator.pushNamed(context, '/');
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded), label: 'Produtos'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.login_rounded), label: 'Cadastro'),           
            ]),
      ),
    );
  }
}
