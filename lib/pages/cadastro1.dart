import 'package:flutter/material.dart';

class Cadastro1 extends StatefulWidget {
  const Cadastro1({super.key});

  @override
  State<Cadastro1> createState() => _Cadastro1State();
}

class _Cadastro1State extends State<Cadastro1> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.,
      // //   title: Text("Cadastro"),
      // ),
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/fundo.png"), // Substitua pelo caminho da sua imagem de fundo
                fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o espaço
              ),
            ),
          ),
          // Centralizando o conteúdo
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Centraliza na vertical
              children: [
                // Imagem do astronauta
                Image.asset(
                  'img/astronalta.png', // Substitua pelo caminho da sua imagem
                  height: 150, // Ajuste a altura conforme necessário
                  width: 150, // Ajuste a largura conforme necessário
                ),
                SizedBox(height: 10), // Espaço entre a imagem e o formulário

                Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E1E1E).withOpacity(0.8), // Fundo semi-transparente
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Campo Nome
                          TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                              iconColor: Colors.black,
                              icon: Icon(Icons.person),
                              hintText: "Informe o nome",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (String? nome) {
                              if (nome == "" || nome == null) {
                                return "O nome não pode ser vazio";
                              }
                              return null;
                            },
                          ),
                          // Campo CPF
                          TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                              iconColor: Colors.black,
                              icon: Icon(Icons.crop_free),
                              hintText: "Informe o CPF",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (String? cpf) {
                              if (cpf == "" || cpf == null) {
                                return "O CPF não pode ser vazio";
                              }
                              if (cpf.length < 11) {
                                return "O CPF está muito curto";
                              }
                              return null;
                            },
                          ),
                          // Campo Celular
                          TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                              iconColor: Colors.black,
                              icon: Icon(Icons.call),
                              hintText: "Informe o celular",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (String? celular) {
                              if (celular == "" || celular == null) {
                                return "O celular não pode ser vazio";
                              }
                              return null;
                            },
                          ),
                          // Campo E-mail
                          TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                              iconColor: Colors.black,
                              icon: Icon(Icons.mail),
                              hintText: "Informe o e-mail",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (String? email) {
                              if (email == "" || email == null) {
                                return "O e-mail não pode ser vazio";
                              }
                              if (email.length < 6) {
                                return "O e-mail está muito curto";
                              }
                              if (!email.contains("@")) {
                                return "O e-mail é inválido";
                              }
                              return null;
                            },
                          ),
                          // Campo Senha
                          TextFormField(
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              iconColor: Colors.black,
                              icon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  _showPassword ? Icons.visibility : Icons.visibility_off,
                                ),
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                              hintText: "Informe a senha",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (String? senha) {
                              if (senha == "" || senha == null) {
                                return "A senha não pode ser vazia";
                              }
                              return null;
                            },
                          ),
                          // Confirmar Senha
                          TextFormField(
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              iconColor: Colors.black,
                              icon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  _showPassword ? Icons.visibility : Icons.visibility_off,
                                ),
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                              hintText: "Confirme a senha",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (String? senha) {
                              if (senha == "" || senha == null) {
                                return "A senha não pode ser vazia";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          // Botão Cadastrar
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                buttonEnterClick();
                              },
                              child: Text("Cadastrar"),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(200, 50),
                                backgroundColor: Colors.yellow,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      print("form ok");
    } else {
      print("form erro");
    }
  }
}
