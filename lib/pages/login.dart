import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/cadastro2.dart';
import 'package:galaxyfy_application/shared/style.dart';

class Login_GalaxyFy extends StatefulWidget {
  const Login_GalaxyFy({super.key});

  @override
  State<Login_GalaxyFy> createState() => _Login_GalaxyFyState();
}

class _Login_GalaxyFyState extends State<Login_GalaxyFy> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 1, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 3, 128),
        title: const Text(
          'Login GalaxyFy',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 82, 3, 128),
              Color.fromARGB(255, 104, 4, 117)
            ],
          ),
          color: const Color.fromARGB(255, 238, 0, 226),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Adicionando a imagem aqui
                Image.asset(
                  'assets/image36.png', // Certifique-se de que o caminho está correto
                  height: 100, // Defina a altura da imagem
                  width: 100,  // Defina a largura da imagem
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    iconColor: Color.fromARGB(255, 238, 0, 226),
                    hintText: "Informe seu e-mail",
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  validator: (String? email) {
                    if (email == "" || email == null) {
                      return "O e-mail não pode ser vazio";
                    }
                    if (email.length < 6) {
                      return "O e-mail está muito curto";
                    }
                    if (!email.contains("@")) {
                      return "O e-mail é invalido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autofocus: true,
                  obscureText: _showPassword == false ? true : false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    suffix: GestureDetector(
                      child: Icon(
                        _showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    iconColor: const Color.fromARGB(255, 238, 0, 226),
                    hintText: "Senha",
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (String? senha) {
                    if (senha == "" || senha == null) {
                      return "A senha não pode ser vazia";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      buttunEnterClick();
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 50),
                      backgroundColor: const Color.fromARGB(255, 238, 0, 226),
                      foregroundColor: const Color.fromARGB(255, 82, 3, 128),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(color: Color.fromARGB(255, 238, 0, 226)),
                const Center(
                  child: Text(
                    "Não tem uma conta?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Cadastro2_GalaxyFy(),
                        ),
                      );
                    },
                    child: const Text(
                      "Cadastre-se",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 238, 0, 226),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buttunEnterClick() {
    if (_formKey.currentState!.validate()) {
      print("form ok");
      Navigator.pushNamed(context, '/home');
    } else {
      print("form erro");
    }
  }
}
