import 'package:flutter/material.dart';

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
        primarySwatch: Colors.green,
      ),
      home: const SizedBox.shrink(),
    );
  }
}
