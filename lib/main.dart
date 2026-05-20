import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const TugasUIApp());
}

class TugasUIApp extends StatelessWidget {
  const TugasUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B141A), // Warna background gelap WA
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0B141A),
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF0B141A),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF25D366), // Hijau WA
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}