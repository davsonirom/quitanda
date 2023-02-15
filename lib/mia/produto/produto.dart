// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/config/utilidades.dart';

import 'package:quitanda/mia/modelos/item_modelo.dart';
import 'package:quitanda/mia/widgest_comun/quantidade.dart';

class Produto extends StatefulWidget {
  const Produto({
    Key? key,
    required this.item,
  }) : super(key: key);
  final ItemModelo item;

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  final Utilidades utilidades = Utilidades();

  int quantidadeDeItemNaSacola = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(235),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.image,
                  child: Image.network(
                    widget.item.image,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(
                          50,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Desing.corContraste,
                          offset: const Offset(0, 2),
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //nome - qunatidade
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.nome,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 27),
                            ),
                          ),
                          Quantidade(
                            quantidade: quantidadeDeItemNaSacola,
                            medida: widget.item.unidade,
                            quantidadeTotal: (quantidade) {
                              setState(() {
                                quantidadeDeItemNaSacola = quantidade;
                              });
                            },
                          ),
                        ],
                      ),

                      //preco
                      Text(
                        utilidades.precoMoeda(widget.item.preco),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Desing.corPrimariaComSwacth,
                          fontSize: 23,
                        ),
                      ),

                      //descricao
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.descricao,
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                        ),
                      ),

                      // botal
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          label: const Text(
                            'Colocar no sacola',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 10,
              left: 10,
              child: SafeArea(
                  child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              )))
        ],
      ),
    );
  }
}
