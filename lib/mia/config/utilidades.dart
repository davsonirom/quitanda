import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Utilidades {
  //! valor moeda
  String precoMoeda(double preco) {
    NumberFormat formatar = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatar.format(preco);
  }

  //! formatar data
  String dataBrasil(DateTime data) {
    initializeDateFormatting();
    DateFormat dateFormata = DateFormat.yMd('pt_br').add_Hm();
    return dateFormata.format(data);
  }
}
