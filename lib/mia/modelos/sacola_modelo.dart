// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:quitanda/mia/modelos/item_modelo.dart';

class SacolaModelo {
  ItemModelo item;
  int quant;
  SacolaModelo({
    required this.item,
    required this.quant,
  });

  double totalAPagar() => item.preco * quant;
}
