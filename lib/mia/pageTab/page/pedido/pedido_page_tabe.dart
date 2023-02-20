import 'package:flutter/material.dart';
import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/pageTab/page/pedido/widgets/pedido_tile.dart';
import '../../../config/mocado_data.dart' as app_data;

class PedidoPageTabe extends StatelessWidget {
  const PedidoPageTabe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minhas compras',
          style: TextStyle(
            color: Desing.corContraste,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 5),
        itemCount: app_data.pedidos.length,
        itemBuilder: (_, index) => PedidoTile(pedido: app_data.pedidos[index]),
      ),
    );
  }
}
