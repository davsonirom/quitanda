// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quitanda/mia/model/sacola_modelo.dart';

class PedidoModelo {
  String id;
  DateTime pedidoRealizadoEm;
  List<SacolaModelo> itens;
  DateTime qrcodeVencido;
  String status;
  String copyPix;
  double total;
  PedidoModelo({
    required this.id,
    required this.pedidoRealizadoEm,
    required this.itens,
    required this.qrcodeVencido,
    required this.status,
    required this.copyPix,
    required this.total,
  });
}
