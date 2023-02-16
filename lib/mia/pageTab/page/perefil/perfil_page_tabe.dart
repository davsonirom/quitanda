// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quitanda/mia/config/desing.dart';

class PerfilPageTabe extends StatelessWidget {
  const PerfilPageTabe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Card(
              elevation: 2,
              color: Colors.white.withAlpha(220),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Desing.corContraste,
                      ),
                    ),
                    // nome
                    const DadoPerfil(label: 'Nome', dado: 'Hatsune Miku'),
                    // email
                    const DadoPerfil(
                        label: 'E-mail', dado: 'miku@vocaloid.co.jp'),
                    // telefone
                    const DadoPerfil(
                        label: 'Telefone', dado: '(38) 98818-4868'),
                    // cpf
                    const DadoPerfil(label: 'CPF', dado: '094.474.749-93'),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Text(
                        'Avenida Alameda das Travessas, nº 111, Edifício Bosque do Cerrado, apartamento 2222 - Bairro dos Barris. CEP: 40000-000.',
                        style: TextStyle(
                          height: 1.5,
                        ),
                      ),
                    ),
                    const Text(
                      'JFI7SNC9C',
                      style: TextStyle(fontSize: 40),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Atualizar dados',
                            style: TextStyle(color: Desing.corContraste)),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class DadoPerfil extends StatelessWidget {
  const DadoPerfil({
    Key? key,
    required this.dado,
    required this.label,
  }) : super(key: key);
  final String dado;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Desing.corContraste.withAlpha(100))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '$label:',
              style: TextStyle(
                  color: Colors.grey.withAlpha(130),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              dado,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
