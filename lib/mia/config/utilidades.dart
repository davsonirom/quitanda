import 'package:intl/intl.dart';

class Utilidades {
  //! valor moeda
  String precoMoeda(double preco) {
    NumberFormat formatar = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatar.format(preco);
  }
}
