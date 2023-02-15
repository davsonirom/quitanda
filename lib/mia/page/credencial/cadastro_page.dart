import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/page/credencial/widgets/text_form.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({Key? key}) : super(key: key);

  final formatarCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  final formatarTelefone = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    final tela = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Desing.corPrimariaComSwacth,
      body: SingleChildScrollView(
        child: SizedBox(
          height: tela.height,
          width: tela.width,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 35),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const TextForm(
                          icon: Icons.email,
                          label: 'E-mail',
                        ),
                        const TextForm(
                          icon: Icons.lock,
                          label: 'Senha',
                          eSecreto: true,
                        ),
                        const TextForm(
                          icon: Icons.person,
                          label: 'Nome',
                        ),
                        TextForm(
                          icon: Icons.phone,
                          label: 'Telefone',
                          formatador: [formatarTelefone],
                        ),
                        TextForm(
                          icon: Icons.file_copy,
                          label: 'CPF',
                          formatador: [formatarCPF],
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {},
                            child: Text(
                              'Cadastrar usuário',
                              style: TextStyle(
                                  fontSize: 20, color: Desing.corContraste),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
