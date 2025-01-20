import 'package:flutter/material.dart';

enum Genero { Masculino, Feminino, Outro }

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
            child: Text(
              'Cadastro',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Insira seus dados',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    )),
                cursorColor: Colors.green,
                onChanged: (text) {
                  email = text;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.green),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                cursorColor: Colors.green,
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
                      activeColor: Colors.green,
                      onChanged: (generoEscolhido) {
                        setState(() {
                          genero = generoEscolhido!;
                        });
                      }),
                  Text('Masculino'),
                  Radio(
                      value: Genero.Feminino,
                      groupValue: genero,
                      activeColor: Colors.green,
                      onChanged: (generoEscolhido) {
                        setState(() {
                          genero = generoEscolhido!;
                        });
                      }),
                  Text('Feminino'),
                  Radio(
                      value: Genero.Outro,
                      groupValue: genero,
                      activeColor: Colors.green,
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
                      activeColor: Colors.green,
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
                  if (email.contains('@') || senha.length < 7) {
                    print('E-mail válido ou senha inválidos');
                    Navigator.pushNamed(context, '/listaProdutos');
                  } else {
                    print('E-mail inválido');
                  }
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
