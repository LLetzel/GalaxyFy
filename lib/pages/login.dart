import 'package:flutter/material.dart';
import 'package:galaxy_fy/pages/perfils.dart';
import 'package:galaxy_fy/shared/style.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importa o pacote de autenticação do Firebase

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
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
          builder: (context) => Perfils(),
        ),
      );
    } catch (e) {
      // Em caso de erro, exibe uma notificação com a mensagem de erro
      _showSnackBar('Erro no login: $e', Colors.red);
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
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MyColors.azulEscuro,
                  MyColors.azulBottomGradiente,
                ],
              ),
              image: DecorationImage(
                image: AssetImage("assets/fundo.png"), // Substitua pelo caminho da sua imagem
                fit: BoxFit.cover, // Ajusta a imagem para cobrir todo o espaço
              ),
            ),
          ),
          // Centraliza o conteúdo do formulário
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Adiciona opacidade ao fundo do formulário
                borderRadius: BorderRadius.circular(8),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text(
                          "Galaxy fy",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Espaçamento entre o título e a imagem
                      Center(
                        child: Image.asset("assets/image17.png"),
                      ),
                      TextFormField(
                        controller: _emailController,
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          icon: Icon(Icons.email),
                          iconColor: const Color.fromARGB(255, 174, 0, 255),
                          hintText: "informe o email",
                        ),
                        validator: (String? email) {
                          if (email == "" || email == null) {
                            return "Email não pode ser vazio";
                          }
                          if (email.length < 6) {
                            return "O email está muito curto";
                          }
                          if (!email.contains('@')) {
                            return "O email é invalido";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        autofocus: true,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          icon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            child: Icon(_showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                          iconColor: const Color.fromARGB(255, 174, 0, 255),
                          hintText: "informe sua senha",
                        ),
                        validator: (String? senha) {
                          if (senha == "" || senha == null) {
                            return "senha não pode ser vazio";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: _login,
                          child: Text('entrar'),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(200, 50),
                            backgroundColor: const Color.fromARGB(255, 174, 0, 255),
                            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10), // Espaçamento
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/cadastro');
                          },
                          child: Text(
                            'Cadastro',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      print("form ok");
      Navigator.pushNamed(context, '/perfils');
    } else {
      print("form erro");
    }
  }
}
