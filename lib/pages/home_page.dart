import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
      ),
      body: const Center(
        child: Text('Layout utama akan ditambahkan di commit selanjutnya', 
          style: TextStyle(color: Colors.white)),
      ),
    );
  }
}