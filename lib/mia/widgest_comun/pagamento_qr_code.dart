// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda/mia/config/utilidades.dart';

import 'package:quitanda/mia/model/pedido_modelo.dart';

class PagamentoQrCode extends StatelessWidget {
  PagamentoQrCode({
    Key? key,
    required this.pedido,
  }) : super(key: key);
  final PedidoModelo pedido;
  final Utilidades utilidades = Utilidades();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // conteudo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // titulo
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Pagamento com Pix',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // qrcode
                QrImage(
                  data: "QuitandaHatsune",
                  version: QrVersions.auto,
                  size: 200.0,
                ),

                // vencimento
                Text(
                  'Vencimento: ${utilidades.dataBrasil(pedido.qrcodeVencido)}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),

                // total
                Text(
                  'Total: ${utilidades.precoMoeda(pedido.total)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // copia colar
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.green,
                      )),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.copy,
                    size: 15,
                  ),
                  label: const Text('Copiar código Pix'),
                ),
              ],
            ),
          ),

          // botao fecahr
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
