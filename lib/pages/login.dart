// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/cadastro.dart';
import 'package:galaxyfy_application/pages/Inicio.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:galaxyfy_application/pages/selecaoperfil.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importa o pacote de autenticação do Firebase

class Login_GalaxyFy extends StatefulWidget {
  const Login_GalaxyFy({super.key});

  @override
  State<Login_GalaxyFy> createState() => _Login_GalaxyFyState();
}

class _Login_GalaxyFyState extends State<Login_GalaxyFy> {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Instância do FirebaseAuth para autenticação
  final TextEditingController _emailController =
      TextEditingController(); // Controlador para o campo de e-mail
  final TextEditingController _passwordController =
      TextEditingController(); // Controlador para o campo de senha

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
        MaterialPageRoute(builder: (context) => InicioPage()),
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

  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _rememberMe = false; // Estado do switch
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState?.validate() == true) {
      // Aqui você pode usar o valor de _rememberMe conforme necessário
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileSelectionPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Stack(
        // stops: [
        //     0.2,
        //     0.5,
        //     0.8,
        //   ],
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/fundo.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 50), // Aumente o valor para mais distância
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/img/astronauta.png',
                          height: 180,
                          width: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        margin: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,

                            end: Alignment.bottomCenter,
                            colors: [
                              MyColors.roxoEscuro, // Cor roxa escura no topo
                              // MyColors.escuro, // Preto na parte de baixo
                              MyColors.roxoEscuro
                            ],
                            // stops: [0.5, 5, 0.5], // Controla o ponto de transição do gradiente
                          ),
                          // color: Color(0xFF1E1E1E), // Cor de fundo
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  fillColor: Color(0xFF1E1E1E),
                                  labelText: 'Email',
                                  prefixIcon:
                                      Icon(Icons.mail, color: Colors.purple),
                                  hintText: "Informe o email",
                                ),
                                style: TextStyle(
                                    color: Colors.white), // Texto em branco
                                validator: (String? email) {
                                  if (email == null || email.isEmpty) {
                                    return "O e-mail não pode ser vazio";
                                  }
                                  if (!email.contains("@")) {
                                    return "O e-mail é inválido";
                                  }
                                  if (email.length < 6) {
                                    return "O e-mail é muito curto";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: !_showPassword,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.purple),
                                  suffixIcon: GestureDetector(
                                    child: Icon(
                                      _showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.purple,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                  ),
                                  hintText: "Digite sua senha",
                                ),
                                style: TextStyle(
                                    color: Colors.white), // Texto em branco
                                validator: (String? password) {
                                  if (password == null || password.isEmpty) {
                                    return "A senha não pode ser vazia";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),

                              // Switch de "Lembrar de mim"
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lembrar de mim",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Switch(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value;
                                      });
                                    },
                                    activeColor: Colors.purple,
                                  ),
                                ],
                              ),

                              SizedBox(height: 15),
                              Center(
                                child: ElevatedButton(
                                  onPressed: _submit,
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
                              const Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      indent: 5,
                                      endIndent: 5,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Text('ou',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      indent: 5,
                                      endIndent: 5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Ícone do Google
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF8D8585), // Cor de fundo
                                      shape: BoxShape.circle, // Forma redonda
                                    ),
                                    child: IconButton(
                                      icon: Image.asset('assets/img/google.png',
                                          height: 25),
                                      onPressed: () {
                                        // Ação para login com Google
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 40),
                                  // Ícone do Facebook
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF8D8585), // Cor de fundo
                                      shape: BoxShape.circle, // Forma redonda
                                    ),
                                    child: IconButton(
                                      icon: Image.asset(
                                          'assets/img/facebook.png',
                                          height: 25),
                                      onPressed: () {
                                        // Ação para login com Facebook
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 40),
                                  // Ícone da Apple
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF8D8585), // Cor de fundo
                                      shape: BoxShape.circle, // Forma redonda
                                    ),
                                    child: IconButton(
                                      icon: Image.asset('assets/img/apple.png',
                                          height: 25),
                                      onPressed: () {
                                        // Ação para login com Apple ID
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Não tem uma conta?  ",
                                      style: TextStyle(
                                          color:
                                              Colors.white), // Texto em branco
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/cadastro");
                                      },
                                      child: Text(
                                        "Inscreva-se",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.purple,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                color: Colors.transparent,
              ),
            ],
          ),
        ],
      ),
    );

    return scaffold;
  }
}
