import 'package:flutter/material.dart';
import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/credencial/login_page.dart';

void main() {
  runApp(const MiaSoftware());
}

class MiaSoftware extends StatelessWidget {
  const MiaSoftware({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quitanda',
      theme: ThemeData(
        primarySwatch: Desing.corPrimariaComSwacth,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      home: const LoginPage(),
    );
  }
}
