// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quitanda/mia/config/desing.dart';
import 'package:quitanda/mia/config/utilidades.dart';

import 'package:quitanda/mia/model/pedido_modelo.dart';
import 'package:quitanda/mia/pageTab/page/pedido/widgets/pedido_status.dart';
import 'package:quitanda/mia/widgest_comun/pagamento_qr_code.dart';

class PedidoTile extends StatelessWidget {
  PedidoTile({
    Key? key,
    required this.pedido,
  }) : super(key: key);
  final PedidoModelo pedido;
  final Utilidades utilidades = Utilidades();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        //? remover bordas do expanded "linhas"
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: pedido.status == 'pagamento_pendente',
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          title: Text(
            'Pedido: ${pedido.id}',
            style: TextStyle(
              color: Desing.corPrimariaComSwacth,
            ),
          ),
          subtitle: Text(
            utilidades.dataBrasil(pedido.pedidoRealizadoEm),
            style: TextStyle(
              color: Desing.corContraste,
              fontWeight: FontWeight.w600,
            ),
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  //* lista dos itens no pedido
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: pedido.itens.map((itemDoPedido) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(children: [
                              Text(
                                '${itemDoPedido.quant}/${itemDoPedido.item.unidade} ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(child: Text(itemDoPedido.item.nome)),
                              Text(
                                utilidades.precoMoeda(
                                  itemDoPedido.totalAPagar(),
                                ),
                              ),
                            ]),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //* divisao
                  VerticalDivider(
                    thickness: 2,
                    color: Desing.corContraste.withAlpha(50),
                    width: 8,
                  ),

                  //* estado do pedido
                  Expanded(
                    flex: 2,
                    child: PedidoStatus(
                      status: pedido.status,
                      taVencido: pedido.qrcodeVencido.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            //? total
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 20),
                children: [
                  const TextSpan(
                    text: 'Total  ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utilidades.precoMoeda(pedido.total),
                  ),
                ],
              ),
            ),

            //? pagamento
            Visibility(
              visible: pedido.status == 'pagamento_pendente',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return PagamentoQrCode(pedido: pedido);
                      });
                },
                icon: const Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
                label: const Text(
                  'Ver QR Code Pix',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
