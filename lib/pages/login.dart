import 'package:flutter/material.dart';
import 'package:gabriel_str/pages/cadastro1.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text("Faça Login"),
      // ),
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/fundo.png"),
                 // Substitua pelo caminho da sua imagem de fundo
                fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o espaço do background
              ),
            ),
          ),
          // Centralizando o conteúdo verticalmente
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Centraliza na vertical
              children: [
                // SizedBox(height: 100),
                // Imagem do astronauta
                Image.asset(
                  'img/astronalta.png', // Substitua pelo caminho da sua imagem
                  height: 200, // Ajuste a altura conforme necessário
                  width: 200, // Ajuste a largura conforme necessário
                ),
                SizedBox(height: 10), // Espaço mínimo entre a imagem e o formulário
                // Formulário
                Container(
                  width: MediaQuery.of(context).size.width * 0.8, // Diminuindo a largura do formulário
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E1E1E), // Cor de fundo do formulário #1E1E1E
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                          TextFormField(
                            autofocus: true,
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              iconColor: Colors.black,
                              icon: const Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
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
                          SizedBox(height: 10),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                buttonEnterClick();
                              },
                              child: Text("Entrar"),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(200, 50),
                                backgroundColor: Color(0xFFD9D9D9), // Cor do botão #D9D9D9
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero, // Bordas quadradas
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Divider(
                            color: Colors.black,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Cadastro1(),
                                ),
                              );
                            },
                            child: GestureDetector(
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline, // Adiciona sublinhado para parecer um link
                                ),
                              ),
                            ),
                          ),
                          const Text("Se não tiver cadastro clique no link acima"),
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
      Navigator.pushNamed(context, '/home');
    } else {
      print("form erro");
    }
  }
}
