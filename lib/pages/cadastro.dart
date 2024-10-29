import 'package:flutter/material.dart';
import 'package:galaxyfy_application/shared/style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cadastro_GalaxyFy extends StatefulWidget {
  const Cadastro_GalaxyFy({super.key});

  @override
  State<Cadastro_GalaxyFy> createState() => _Cadastro_GalaxyFyState();
}

class _Cadastro_GalaxyFyState extends State<Cadastro_GalaxyFy> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Tenta criar o usuário com e-mail e senha
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Tenta atualizar o nome do usuário
        await userCredential.user!
            .updateDisplayName(_usernameController.text.trim());
        await userCredential.user!.reload();
        _auth.currentUser; // Recarrega o usuário atualizado

        // Exibe uma notificação de sucesso e redireciona
        _showSnackBar('Cadastro realizado com sucesso!', Colors.green);
        Navigator.pop(context); // Volta para a tela de login após o cadastro
      } catch (e) {
        // Exibe uma notificação de erro específico
        _showSnackBar('Erro no cadastro: ${e.toString()}', Colors.red);
      }
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

  // final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  String? _senha;
  String? _confirmarSenha;

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
                              MyColors.roxoEscuro
                            ],
                          ),
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                  prefixIcon:
                                      Icon(Icons.person, color: Colors.purple),
                                  hintText: "Digite seu nome",
                                  hintStyle: TextStyle(color: Colors.white54),
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'CPF',
                                  prefixIcon:
                                      Icon(Icons.numbers, color: Colors.purple),
                                  hintText: "Digite seu CPF",
                                  hintStyle: TextStyle(color: Colors.white54),
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Celular',
                                  prefixIcon:
                                      Icon(Icons.call, color: Colors.purple),
                                  hintText: "Digite seu número",
                                  hintStyle: TextStyle(color: Colors.white54),
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon:
                                      Icon(Icons.mail, color: Colors.purple),
                                  hintText: "Informe o email",
                                  hintStyle: TextStyle(color: Colors.white54),
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
                                style: TextStyle(color: Colors.white),
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
                                  hintStyle: TextStyle(color: Colors.white54),
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
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Confirmar senha',
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.purple),
                                  suffixIcon: GestureDetector(
                                    child: Icon(
                                      _showConfirmPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.purple,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _showConfirmPassword =
                                            !_showConfirmPassword;
                                      });
                                    },
                                  ),
                                  hintText: "Confirme sua senha",
                                  hintStyle: TextStyle(color: Colors.white54),
                                ),
                                onChanged: (value) {
                                  _confirmarSenha = value;
                                },
                                validator: (String? confirmPassword) {
                                  if (confirmPassword == null ||
                                      confirmPassword.isEmpty) {
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
