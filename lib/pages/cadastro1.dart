// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';

class Cadastro_GalaxyFy extends StatelessWidget {
  const Cadastro_GalaxyFy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title: Text('Cadastro GalaxyFy'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    iconColor: Colors.purple,
                    hintText: "Digite seu nome",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                    iconColor: Colors.purple,
                    hintText: "Informe o email",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    iconColor: Colors.purple,
                    hintText: "Digite sua senha",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers),
                    iconColor: Colors.purple,
                    hintText: "Digite seu CPF",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'CEP',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.local_activity),
                    iconColor: Colors.purple,
                    hintText: "Digite seu CEP",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Logradouro',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.local_activity),
                    iconColor: Colors.purple,
                    hintText: "Digite seu nome",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Logradouro',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.local_activity),
                    iconColor: Colors.purple,
                    hintText: "Digite seu nome",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Número',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.local_activity),
                    iconColor: Colors.purple,
                    hintText: "Digite o número de sua casa",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Bairro',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.local_activity),
                    iconColor: Colors.purple,
                    hintText: "Digite o seu bairro",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Complemento',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.local_activity),
                    iconColor: Colors.purple,
                    hintText: "Complemento",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Cidade',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_city),
                    iconColor: Colors.purple,
                    hintText: "Cidade",
                  )),
              TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Estado',
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_city),
                    iconColor: Colors.purple,
                    hintText: "Estado",
                  )),
              SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Cadastrar"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(120, 50),
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Remove o arredondamento
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Divider(color: Colors.black),
              const Text("Entrar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const Text("Ja tem uma conta? Entre pelo link acima"),
            ],
          ),
        ),
      ),
    );
  }
}
