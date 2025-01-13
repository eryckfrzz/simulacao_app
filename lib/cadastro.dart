import 'package:flutter/material.dart';

enum Genero { Masculino, Feminino, Outro }

void main() {
  runApp(Cadastro());
}

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String email = '';
  String senha = '';
  bool aceitoTermos = false;
  Genero genero = Genero.Masculino;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Cadastro'),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Insira seus dados',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'E-mail'),
                onChanged: (text) {
                  email = text;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                onChanged: (text) {
                  email = text;
                },
              ),
              Row(
                children: [
                  Radio(
                      value: Genero.Masculino,
                      groupValue: genero,
                      onChanged: (generoEscolhido) {
                        setState(() {
                          genero = generoEscolhido!;
                        });
                      }),
                  Text('Masculino'),
                  Radio(
                      value: Genero.Feminino,
                      groupValue: genero,
                      onChanged: (generoEscolhido) {
                        setState(() {
                          genero = generoEscolhido!;
                        });
                      }),
                  Text('Feminino'),
                  Radio(
                      value: Genero.Outro,
                      groupValue: genero,
                      onChanged: (generoEscolhido) {
                        setState(() {
                          genero = generoEscolhido!;
                        });
                      }),
                  Text('Outro')
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: aceitoTermos,
                      onChanged: (check) {
                        setState(() {
                          aceitoTermos = check!;
                        });
                      }),
                  Text('Li e concordo com os termos da aplicação')
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (email.contains('@')) {
                    print('E-mail válido');
                    Navigator.pushNamed(context, '/produtos');
                  } else {
                    print('E-mail inválido');
                  }
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
