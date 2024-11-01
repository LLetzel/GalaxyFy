import 'package:flutter/material.dart';

class Cadastro_GalaxyFy extends StatelessWidget {
  const Cadastro_GalaxyFy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Login GalaxyFy'),
      ),

      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(20)),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    iconColor: Colors.blue,
                    hintText: "Nome"),
              ),

              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    iconColor: Colors.blue,
                    hintText: "Email"),
              ),

              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    iconColor: Colors.blue,
                    hintText: "Senha"),
              ),

               const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.numbers),
                    iconColor: Colors.blue,
                    hintText: "CPF"),
              ),

              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.local_activity),
                    iconColor: Colors.blue,
                    hintText: "CEP"),
              ),

              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.local_activity),
                    iconColor: Colors.blue,
                    hintText: "Logradouro"),
              ),

              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.local_activity),
                    iconColor: Colors.blue,
                    hintText: "Numero"),
              ),

              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.local_activity),
                    iconColor: Colors.blue,
                    hintText: "Bairro"),
              ),

              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.local_activity),
                    iconColor: Colors.blue,
                    hintText: "Complemento"),
              ),

              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.local_activity),
                    iconColor: Colors.blue,
                    hintText: "Cidade"),
              ),

              const TextField(
                autofocus: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.local_activity),
                    iconColor: Colors.blue,
                    hintText: "Estado"),
              ),

              SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("cadastrar"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(120, 50),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Divider(color: Colors.black),
              const Text("Cadastrar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const Text("Se não tiver cadastro clique no link acima"),
            ],
          ),
        ),
      ),
    );
  }
}
