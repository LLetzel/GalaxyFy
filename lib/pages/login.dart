// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/cadastro.dart';
import 'package:galaxyfy_application/pages/Inicio.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:galaxyfy_application/pages/selecaoperfil.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importa o pacote de autenticação do Firebase
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
      _showSnackBar('Bem vindo!', Colors.purple);
      // Se o login for bem-sucedido, navega para a tela inicial
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileSelectionPage()),
      );
    } catch (e) {
      // Em caso de erro, exibe uma notificação com a mensagem de erro
      _showSnackBar('Email ou senha inválidos', Colors.red);
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
                              MyColors.roxoEscuro,
                              MyColors.roxoEscuro,
                            ],
                          ),
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
                                  labelText: 'Email',
                                  prefixIcon:
                                      Icon(Icons.mail, color: Colors.purple),
                                  hintText: "Informe o email",
                                ),
                                style: TextStyle(color: Colors.white),
                                validator: (String? email) {
                                  if (email == null || email.isEmpty) {
                                    return "O e-mail não pode ser vazio";
                                  }
                                  if (!email.contains("@")) {
                                    return "O e-mail é inválido";
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
                                style: TextStyle(color: Colors.white),
                                validator: (String? password) {
                                  if (password == null || password.isEmpty) {
                                    return "A senha não pode ser vazia";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
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
                              // Botão para login com o Google
                              Center(
                                child: TextButton(
                                  onPressed: () async {
                                    GoogleSignIn googleSignIn = GoogleSignIn();

                                    try {
                                      GoogleSignInAccount? googleUser =
                                          await googleSignIn.signIn();

                                      if (googleUser == null) {
                                        _showSnackBar(
                                            'Login cancelado pelo usuário.',
                                            Colors.red);
                                        return;
                                      }

                                      GoogleSignInAuthentication googleAuth =
                                          await googleUser.authentication;

                                      OAuthCredential credential =
                                          GoogleAuthProvider.credential(
                                        accessToken: googleAuth.accessToken,
                                        idToken: googleAuth.idToken,
                                      );

                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .signInWithCredential(credential);

                                      User? user = userCredential.user;
                                      if (user != null) {
                                        print(
                                            'Usuário autenticado: ${user.displayName}');
                                        _showSnackBar(
                                            'Bem-vindo, ${user.displayName}!',
                                            Colors.purple);

                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileSelectionPage()),
                                        );
                                      }
                                    } catch (e) {
                                      _showSnackBar('Erro ao fazer login: $e',
                                          Colors.red);
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 16), // Ajustando o padding
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    fixedSize: Size(230,
                                        40), // Ajustando o tamanho do botão
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/img/google.png',
                                            height: 16), // Menor ícone
                                        SizedBox(width: 8),
                                        Text(
                                          'Continuar com o Google',
                                          style: TextStyle(
                                            fontSize:
                                                15, // Ajustando o tamanho da fonte
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Não tem uma conta?  ",
                                      style: TextStyle(color: Colors.white),
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
