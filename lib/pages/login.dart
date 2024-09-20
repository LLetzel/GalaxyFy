// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:galaxyfy_application/pages/cadastro.dart';

class Login_GalaxyFy extends StatefulWidget {
  const Login_GalaxyFy({super.key});

  @override
  State<Login_GalaxyFy> createState() => _Login_GalaxyFyState();
}

class _Login_GalaxyFyState extends State<Login_GalaxyFy> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState?.validate() == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Cadastro_GalaxyFy(),
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
              'img/fundo.png',
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
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'img/astronauta.png',
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
                          color: Color(0xFF1E1E1E), // Cor de fundo
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
                                  prefixIcon: Icon(Icons.mail),
                                  iconColor: Colors.purple,
                                  hintText: "Informe o email",
                                ),
                                style: TextStyle(color: Colors.white), // Texto em branco
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
                                  prefixIcon: Icon(Icons.lock),
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
                                  iconColor: Colors.purple,
                                  hintText: "Digite sua senha",
                                ),
                                style: TextStyle(color: Colors.white), // Texto em branco
                                validator: (String? password) {
                                  if (password == null || password.isEmpty) {
                                    return "A senha não pode ser vazia";
                                  }
                                  return null;
                                },
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
                              Divider(color: Colors.black),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Não tem uma conta?  ",
                                      style: TextStyle(color: Colors.white), // Texto em branco
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context, "/cadastro");
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
