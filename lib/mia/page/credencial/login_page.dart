import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/mia/pageTab/banca_page.dart';
import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/page/credencial/cadastro_page.dart';
import 'package:quitanda/mia/page/credencial/widgets/text_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tela = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Desing.corPrimariaComSwacth,
      body: SingleChildScrollView(
        child: SizedBox(
          height: tela.height,
          width: tela.width,
          child: Column(
            children: [
              //? nome do quitanda
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text.rich(
                        TextSpan(
                            style: const TextStyle(fontSize: 40),
                            children: [
                              const TextSpan(
                                text: 'Quitanda',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: 'Hatsune',
                                  style: TextStyle(color: Desing.corContraste)),
                            ]),
                      ),
                      //* tipos de produtos
                      SizedBox(
                        height: 25,
                        child: DefaultTextStyle(
                          style: const TextStyle(fontSize: 20),
                          child: AnimatedTextKit(
                              pause: Duration.zero,
                              repeatForever: true,
                              animatedTexts: [
                                FadeAnimatedText('Frutas'),
                                FadeAnimatedText('Verduras'),
                                FadeAnimatedText('Legumes'),
                                FadeAnimatedText('Carnes'),
                                FadeAnimatedText('Cereais'),
                                FadeAnimatedText('Laticínios'),
                              ]),
                        ),
                      ),
                      //* logo da quitanda
                      SizedBox(
                        height: 150,
                        child: Image.asset(
                          'assets/logo.png',
                        ),
                      ),
                    ]),
              ),
              //? formulario de login/
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 35),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const TextForm(
                          label: 'E-mal',
                          icon: Icons.email,
                        ),
                        const TextForm(
                          label: 'Senha',
                          icon: Icons.lock,
                          eSecreto: true,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) {
                                return const BancaPage();
                              }));
                            },
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                  fontSize: 20, color: Desing.corContraste),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text('Esqueceu sua Senha?',
                                style: TextStyle(color: Desing.corAlerta)),
                          ),
                        ),

                        //* divisor
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Ou',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 2,
                                    color: Desing.corPrimariaComSwacth),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return CadastroPage();
                              }));
                            },
                            child: const Text(
                              'Criar conta',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
