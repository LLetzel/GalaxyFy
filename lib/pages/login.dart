import 'package:flutter/material.dart';
import 'package:gabriel_str/pages/cadastro1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gabriel_str/pages/selecaoperfil.dart'; // Importa o pacote de autenticação do Firebase

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Instância do FirebaseAuth para autenticação
  final TextEditingController _emailController = TextEditingController(); // Controlador para o campo de e-mail
  final TextEditingController _passwordController = TextEditingController(); // Controlador para o campo de senha

  // Método assíncrono para realizar o login
  Future<void> _login() async {
    try {
      // Tenta fazer login com e-mail e senha fornecidos
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Se o login for bem-sucedido, navega para a tela inicial
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SelecaoPerfil(),
        ),
      );
    } catch (e) {
      // Em caso de erro, exibe uma notificação com a mensagem de erro
      _showSnackBar('Email e/o senha inválidos', Colors.red);
    }
  }

  // Método para exibir uma mensagem na parte inferior da tela (SnackBar)
  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2), // Duração de exibição do SnackBar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
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
                image: AssetImage("assets/img/fundo.png"),
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
                  'assets/img/astronalta.png', // Substitua pelo caminho da sua imagem
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
                    // key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            autofocus: true,
                            decoration: InputDecoration(
                              iconColor: Colors.black,
                              icon: Icon(Icons.mail),
                              hintText: "Informe o e-mail",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(color: Colors.white), // Adicione esta linha
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
                            controller: _passwordController,
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
                            style: TextStyle(color: Colors.white), // Adicione esta linha
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
                                  onPressed: _login,
                                  child: Text("Entrar"),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(120, 50),
                                    backgroundColor: Colors.purple,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
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
}

