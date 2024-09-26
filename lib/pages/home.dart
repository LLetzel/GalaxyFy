import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 129, 5, 123),
        title: const Text(
          "HOME",
            style: TextStyle(
            color: Colors.white,
          ),
          ),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem-vindo à Página Inicial!',
              style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 129, 5, 123)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação ao pressionar o botão
              },
                child: Text(
                'Vamos iniciar!',
                style: const TextStyle(
                  color: Color.fromARGB(255, 129, 5, 123),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
