import 'package:flutter/material.dart';
import 'package:gabriel_str/pages/cadastro1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Pacote Google Sign-In
import 'package:gabriel_str/pages/selecaoperfil.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(); // Instância para autenticação do Google
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SelecaoPerfil(),
        ),
      );
    } catch (e) {
      _showSnackBar('Email e/ou senha inválidos', Colors.red);
    }
  }

  Future<void> _loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _showSnackBar('Login cancelado', Colors.orange);
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SelecaoPerfil(),
        ),
      );
    } catch (e) {
      _showSnackBar('Falha no login com Google $Error', Colors.red);
    }
  }

  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/fundo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/img/astronalta.png',
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.mail),
                          hintText: "Informe o e-mail",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
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
                        style: TextStyle(color: Colors.white),
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
                      SizedBox(height: 10),
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
                                                  SelecaoPerfil()),
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
                                        50), // Ajustando o tamanho do botão
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/icons/google.png',
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
                      SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Cadastro1(),
                            ),
                          );
                        },
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const Text(
                          "Se não tiver cadastro clique no link acima"),
                    ],
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