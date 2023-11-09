import 'package:flutter/material.dart';
import 'pages/intro_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(const MainApp()); // Remove "const" here
}

class MainApp extends StatelessWidget {
  const MainApp({super.key}); // Use "Key? key" instead of "super.key"

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
      },
    );
  }
}
