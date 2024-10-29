import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Hello Word"),),
        // floatingActionButton: FloatingActionButton(onPressed: (){},
        // child: Icon(Icons.add),),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8)
        ),
        height:500,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.person),
                  hintText: "Informe o nome"
                ),),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.mail),
                  hintText: "Informe o e-mail"
                ),),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.lock),
                  hintText: "Informe a senha"
                ),),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.crop_free),
                  hintText: "Informe o cpf"
                ),),
                TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.local_activity),
                  hintText: "Informe o cep"
                ),),
                TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.local_activity),
                  hintText: "Informe o logradouro"
                ),),
                TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.local_activity),
                  hintText: "Informe o nº"
                ),),
                TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.local_activity),
                  hintText: "Informe o bairro"
                ),),
                TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.local_activity),
                  hintText: "Informe o complemento"
                ),),
                TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.local_activity),
                  hintText: "Informe o cidade"
                ),),
                TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  iconColor: Colors.black,
                  icon: Icon(Icons.local_activity),
                  hintText: "Informe o estado"
                ),),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(onPressed: (){}, child: Text("Cadastrar"),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Bordas quadradas
                  ),
                )),
              ),
               SizedBox(height: 15),
              Divider(color: Colors.black,),
              const Text("Me cadastrar", 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              const Text("Se não tiver cadastro clique no link acima"),
            ],
          ),
        ),
      ),    
    );
  }
}