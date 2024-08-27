import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.userName});

  final String title;
  final String userName;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Substitua o caminho da imagem conforme necessário
            Image.asset('assets/your_image.png', height: 150.0), // Imagem centralizada
            const SizedBox(height: 20.0),
            Text(
              'Bem-vindo, ${widget.userName}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de registro
                GoRouter.of(context).go('/register');
              },
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
