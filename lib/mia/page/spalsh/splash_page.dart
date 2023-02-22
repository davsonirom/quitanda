import 'package:flutter/material.dart';
import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/page/credencial/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return const LoginPage();
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Desing.corContraste,
              Desing.corPrimariaComSwacth.shade700,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 40),
                children: [
                  TextSpan(
                      text: 'Quitanda ',
                      style: TextStyle(color: Desing.corPrimariaComSwacth)),
                  TextSpan(
                      text: 'Hatsune',
                      style:
                          TextStyle(color: Desing.corContraste, fontSize: 20))
                ],
              ),
            ),
            const SizedBox(height: 10),
            const LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
