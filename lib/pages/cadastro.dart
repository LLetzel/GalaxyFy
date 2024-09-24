// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';

class Cadastro_GalaxyFy extends StatefulWidget {
  const Cadastro_GalaxyFy({super.key});

  @override
  State<Cadastro_GalaxyFy> createState() => _Cadastro_GalaxyFyState();
}

class _Cadastro_GalaxyFyState extends State<Cadastro_GalaxyFy> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  String? _senha;
  String? _confirmarSenha;

  void _submit() {
    if (_formKey.currentState?.validate() == true) {
      // Se o formulário for válido, prossiga com o cadastro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title: Text('Cadastro GalaxyFy'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/fundo.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/img/astronauta.png',
                        height: 180,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        margin: const EdgeInsets.all(10),
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                autofocus: true,
                                style: TextStyle(color: Colors.white), // Texto em branco
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                  prefixIcon: Icon(Icons.person, color: Colors.purple),
                                  hintText: "Digite seu nome",
                                  hintStyle: TextStyle(color: Colors.white54), // Dica em branco claro
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "O nome não pode ser vazio";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                autofocus: true,
                                style: TextStyle(color: Colors.white), // Texto em branco
                                decoration: InputDecoration(
                                  labelText: 'CPF',
                                  prefixIcon: Icon(Icons.numbers, color: Colors.purple),
                                  hintText: "Digite seu CPF",
                                  hintStyle: TextStyle(color: Colors.white54), // Dica em branco claro
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "O CPF não pode ser vazio";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                autofocus: true,
                                style: TextStyle(color: Colors.white), // Texto em branco
                                decoration: InputDecoration(
                                  labelText: 'Celular',
                                  prefixIcon: Icon(Icons.call, color: Colors.purple),
                                  hintText: "Digite seu número",
                                  hintStyle: TextStyle(color: Colors.white54), // Dica em branco claro
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "O número não pode ser vazio";
                                  }
                                  if (value.length < 10 || value.length > 11) {
                                    return "O número deve ter entre 10 e 11 dígitos";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                autofocus: true,
                                style: TextStyle(color: Colors.white), // Texto em branco
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.mail, color: Colors.purple),
                                  hintText: "Informe o email",
                                  hintStyle: TextStyle(color: Colors.white54), // Dica em branco claro
                                ),
                                validator: (String? email) {
                                  if (email == null || email.isEmpty) {
                                    return "O e-mail não pode ser vazio";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                autofocus: true,
                                obscureText: !_showPassword,
                                style: TextStyle(color: Colors.white), // Texto em branco
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  prefixIcon: Icon(Icons.lock, color: Colors.purple),
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
                                  hintStyle: TextStyle(color: Colors.white54), // Dica em branco claro
                                ),
                                onChanged: (value) {
                                  _senha = value;
                                },
                                validator: (String? password) {
                                  if (password == null || password.isEmpty) {
                                    return "A senha não pode ser vazia";
                                  }
                                  if (password.length < 6) {
                                    return "A senha deve ter pelo menos 6 caracteres";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                autofocus: true,
                                obscureText: !_showConfirmPassword,
                                style: TextStyle(color: Colors.white), // Texto em branco
                                decoration: InputDecoration(
                                  labelText: 'Confirmar senha',
                                  prefixIcon: Icon(Icons.lock, color: Colors.purple),
                                  suffixIcon: GestureDetector(
                                    child: Icon(
                                      _showConfirmPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                          color: Colors.purple,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _showConfirmPassword = !_showConfirmPassword;
                                      });
                                    },
                                  ),
                                  hintText: "Confirme sua senha",
                                  hintStyle: TextStyle(color: Colors.white54), // Dica em branco claro
                                ),
                                onChanged: (value) {
                                  _confirmarSenha = value;
                                },
                                validator: (String? confirmPassword) {
                                  if (confirmPassword == null || confirmPassword.isEmpty) {
                                    return "A confirmação de senha não pode ser vazia";
                                  }
                                  if (confirmPassword != _senha) {
                                    return "As senhas não coincidem";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
                              Center(
                                child: ElevatedButton(
                                  onPressed: _submit,
                                  child: Text("Cadastrar"),
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
  }
}
