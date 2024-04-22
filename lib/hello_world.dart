import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ini AppBar"),
        ),
        body: const Center(
          child: Text("Ini Text Center"),
        ),
      ),
    );
  }
}
