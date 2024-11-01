import 'package:flutter/material.dart';

class Cadastro2_GalaxyFy extends StatefulWidget {
  const Cadastro2_GalaxyFy({super.key});

  @override
  State<Cadastro2_GalaxyFy> createState() => _Cadastro2_GalaxyFyState();
}

class _Cadastro2_GalaxyFyState extends State<Cadastro2_GalaxyFy> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 5, 29),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 3, 128),
        title: Text('Login GalaxyFy', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
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
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20)),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      iconColor: const Color.fromARGB(255, 253, 253, 253),
                      hintText: "Nome"),
                  style: const TextStyle(color: Colors.white),
                  validator: (String? nome) {
                    if (nome == "" || nome == null) {
                      return "O nome não pode ser vazio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.numbers),
                      iconColor: const Color.fromARGB(255, 255, 255, 255),
                      hintText: "CPF"),
                  style: const TextStyle(color: Colors.white),
                  validator: (String? CPF) {
                    if (CPF == "" || CPF == null) {
                      return "O CPF não pode ser vazio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.call),
                      iconColor: const Color.fromARGB(207, 255, 255, 255),
                      hintText: "Celular"),
                  style: const TextStyle(color: Colors.white),
                  validator: (String? celular) {
                    if (celular == "" || celular == null) {
                      return "O celular não pode ser vazio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      iconColor: const Color.fromARGB(255, 255, 255, 255),
                      hintText: "Email"),
                  style: const TextStyle(color: Colors.white),
                  validator: (String? Email) {
                    if (Email == "" || Email == null) {
                      return "O Email não pode ser vazio";
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
                      iconColor: const Color.fromARGB(255, 255, 255, 255),
                      hintText: "Senha"),
                  style: const TextStyle(color: Colors.white),
                  validator: (String? Senha) {
                    if (Senha == "" || Senha == null) {
                      return "A senha não pode ser vazio";
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
                      iconColor: const Color.fromARGB(255, 255, 255, 255),
                      hintText: "Confirmar Senha"),
                  style: const TextStyle(color: Colors.white),
                  validator: (String? ConfirmarSenha) {
                    if (ConfirmarSenha == "" || ConfirmarSenha == null) {
                      return "O Confirmar senha não pode ser vazio";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      buttunEnterClick();
                    },
                    child: Text("cadastrar"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 50),
                      backgroundColor: const Color.fromARGB(255, 238, 0, 226),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Divider(color: const Color.fromARGB(255, 238, 0, 226)),
                const Text("",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
      Navigator.pushNamed(context, '/');
    } else {
      print("form erro");
    }
  }
}
