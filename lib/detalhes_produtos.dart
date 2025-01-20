import 'package:flutter/material.dart';

class DetalhesProdutos extends StatefulWidget {
  final String? produtoId;
  final String? produto;
  final String? endereco;
  final String? descricao;
  final String? imagem;
  final int? quantidade;
  final double? preco;

  const DetalhesProdutos(
      {super.key,
      this.produtoId,
      this.produto,
      this.endereco,
      this.descricao,
      this.imagem,
      this.quantidade,
      this.preco});

  @override
  State<DetalhesProdutos> createState() => _DetalhesProdutosState();
}

class _DetalhesProdutosState extends State<DetalhesProdutos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Veja mais')),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/produto.png',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              Text(widget.produto.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('R\$' + widget.preco.toString()),
                ],
              ),
              Text(widget.descricao.toString()),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Voltar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
