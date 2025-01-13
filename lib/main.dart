import 'package:flutter/material.dart';
import 'package:simulacao_app/cadastro.dart';
import 'package:simulacao_app/produtos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Cadastro(),
      '/produtos': (context) => Produtos()
    },);
  }
}
