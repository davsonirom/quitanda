// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quitanda/mia/config/desing.dart';

class Quantidade extends StatelessWidget {
  const Quantidade({
    Key? key,
    required this.quantidade,
    required this.medida,
    required this.quantidadeTotal,
  }) : super(key: key);

  final int quantidade;
  final String medida;
  final Function(int comprar) quantidadeTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Desing.corContraste,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          _BotaoDeQuantidade(
            icone: Icons.remove,
            cor: Colors.grey.shade300,
            funcao: () {
              // remover item
              if (quantidade == 1) return;
              int itemSacola = quantidade - 1;
              quantidadeTotal(itemSacola);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$quantidade$medida',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          _BotaoDeQuantidade(
            icone: Icons.add,
            cor: Desing.corPrimariaComSwacth,
            funcao: () {
              // adiconar item
              int itemSacola = quantidade + 1;
              quantidadeTotal(itemSacola);
            },
          ),
        ],
      ),
    );
  }
}

class _BotaoDeQuantidade extends StatelessWidget {
  final IconData icone;
  final Color cor;
  final VoidCallback funcao;

  const _BotaoDeQuantidade({
    Key? key,
    required this.icone,
    required this.cor,
    required this.funcao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onTap: funcao,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: cor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icone,
            size: 16,
          ),
        ),
      ),
    );
  }
}
