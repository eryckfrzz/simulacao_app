import 'package:flutter/material.dart';
import 'package:simulacao_app/cadastro.dart';
import 'package:simulacao_app/detalhes_produtos.dart';
import 'package:simulacao_app/listar_produtos.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Cadastro(),
        '/listaProdutos': (context) => Listarprodutos(),
      },
    );
  }
}
