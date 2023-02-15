import 'package:flutter/material.dart';
import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/config/utilidades.dart';
import 'package:quitanda/mia/modelos/sacola_modelo.dart';
import 'package:quitanda/mia/sacola/widgets/sacola_tile.dart';
import '../config/mocado_data.dart' as app_data;

class SacolaPageTab extends StatefulWidget {
  const SacolaPageTab({Key? key}) : super(key: key);

  @override
  State<SacolaPageTab> createState() => _SacolaPageTabState();
}

class _SacolaPageTabState extends State<SacolaPageTab> {
  final Utilidades utilidades = Utilidades();

  void removerDaSacola(SacolaModelo sacolaItem) {
    setState(() {
      app_data.sacolaCheia.remove(sacolaItem);
    });
  }

  double valorDaCompra() {
    double total = 0;
    for (var item in app_data.sacolaCheia) {
      total += item.totalAPagar();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sacola',
          style: TextStyle(color: Desing.corContraste),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: app_data.sacolaCheia.length,
              itemBuilder: (_, index) {
                return SacolaTile(
                  sacolaItem: app_data.sacolaCheia[index],
                  remove: removerDaSacola,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                )
              ],
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Total geral',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    utilidades.precoMoeda(valorDaCompra()),
                    style: TextStyle(
                      fontSize: 23,
                      color: Desing.corPrimariaComSwacth,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool? resultado = await confirmaOrdemDeCompra();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Desing.corContraste,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Fazer pedido',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> confirmaOrdemDeCompra() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text('Confirmação'),
            content: const Text('Deseja realizar seu pedido?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'Não',
                  style: TextStyle(color: Desing.corAlerta),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Desing.corPrimariaComSwacth,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }
}
