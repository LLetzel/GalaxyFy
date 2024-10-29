import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 0, 255),
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("Cadastre-se"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fundo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo do formulário
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Image.asset("assets/image17.png"), // Adiciona a imagem aqui
                    // Você pode ajustar a altura ou largura se necessário
                  ),
                  SizedBox(height: 16), // Espaçamento após a imagem
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      icon: Icon(Icons.abc),
                      iconColor: const Color.fromARGB(255, 174, 0, 255),
                      hintText: "informe seu nome",
                    ),
                    validator: (String? nome) {
                      if (nome == "" || nome == null) {
                        return "nome não pode ser vazio";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                      iconColor: const Color.fromARGB(255, 174, 0, 255),
                      hintText: "informe seu email",
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
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      icon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        child: Icon(_showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility),
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
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Confirme a Senha',
                      icon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        child: Icon(_showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility),
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
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'CPF',
                      icon: Icon(Icons.account_circle),
                      iconColor: const Color.fromARGB(255, 174, 0, 255),
                      hintText: "informe seu CPF",
                    ),
                    validator: (String? cpf) {
                      if (cpf == "" || cpf == null) {
                        return "CPF não pode ser vazio";
                      }
                      if (cpf.length < 11) {
                        return "O CPF está muito curto";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Número',
                      icon: Icon(Icons.call_end_outlined),
                      iconColor: const Color.fromARGB(255, 174, 0, 255),
                      hintText: "informe seu número",
                    ),
                    validator: (String? numero) {
                      if (numero == "" || numero == null) {
                        return "número não pode ser vazio";
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
                      child: Text('Entrar'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 50),
                        backgroundColor: const Color.fromARGB(255, 174, 0, 255),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
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
    } else {
      print("form erro");
    }
  }
}
