// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quitanda/mia/config/desing.dart';

class CategoriaTile extends StatelessWidget {
  const CategoriaTile({
    Key? key,
    required this.categoria,
    required this.selecionda,
    required this.onPressed,
  }) : super(key: key);
  final String categoria;
  final bool selecionda;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              color:
                  selecionda ? Desing.corPrimariaComSwacth : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            categoria,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selecionda ? Colors.white : Desing.corContraste,
              fontSize: selecionda ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
