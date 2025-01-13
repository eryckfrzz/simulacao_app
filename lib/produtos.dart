import 'package:flutter/material.dart';
import 'package:simulacao_app/main.dart';

void main() {
  runApp(Produtos());
}

class Produtos extends StatelessWidget {
  const Produtos({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listaProdutos = [];

    for (int i = 1; i <= 100; i++) {
      listaProdutos.add('Poduto $i');
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Produtos'),
          ),
          backgroundColor: Colors.purple,
        ),
        body: ListView.builder(
            itemCount: listaProdutos.length,
            itemBuilder: (context, indice) {
              return ListTile(
                title: Text(
                  listaProdutos[indice],
                ),
              );
            }),
      ),
    );
  }
}
