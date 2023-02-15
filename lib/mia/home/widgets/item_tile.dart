// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/config/utilidades.dart';

import 'package:quitanda/mia/modelos/item_modelo.dart';

class ItemTile extends StatelessWidget {
  ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModelo item;
  final Utilidades helps = Utilidades();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 1,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //? imagnme
                Expanded(
                  child: Image.network(item.image),
                ),

                //? nome da fruta
                Text(
                  item.nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      helps.precoMoeda(item.preco),
                      style: TextStyle(
                        color: Desing.corPrimariaComSwacth,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '/${item.unidade}',
                      style: TextStyle(
                          color: Desing.corContraste.withAlpha(100),
                          fontSize: 12),
                    )
                  ],
                )
                //? preco - unidade de medida
              ],
            ),
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 35,
                decoration: BoxDecoration(
                  color: Desing.corPrimariaComSwacth,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(14),
                  ),
                ),
                child: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            )),
      ],
    );
  }
}
