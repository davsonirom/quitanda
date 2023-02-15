// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/config/utilidades.dart';
import 'package:quitanda/mia/model/sacola_modelo.dart';
import 'package:quitanda/mia/widgest_comun/quantidade.dart';

class SacolaTile extends StatefulWidget {
  const SacolaTile({
    Key? key,
    required this.sacolaItem,
    required this.remove,
  }) : super(key: key);
  final SacolaModelo sacolaItem;
  final Function(SacolaModelo) remove;

  @override
  State<SacolaTile> createState() => _SacolaTileState();
}

class _SacolaTileState extends State<SacolaTile> {
  final Utilidades utilidades = Utilidades();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), bottomLeft: Radius.circular(15)),
      ),
      child: ListTile(
        leading: Image.network(
          widget.sacolaItem.item.image,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.sacolaItem.item.nome,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          utilidades.precoMoeda(
            widget.sacolaItem.totalAPagar(),
          ),
          style: TextStyle(
            color: Desing.corPrimariaComSwacth,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Quantidade(
          quantidade: widget.sacolaItem.quant,
          medida: widget.sacolaItem.item.unidade,
          quantidadeTotal: (quantidade) {
            setState(() {
              widget.sacolaItem.quant = quantidade;
              if (quantidade == 0) {
                widget.remove(widget.sacolaItem);
              }
            });
          },
          paraRemover: true,
        ),
      ),
    );
  }
}
