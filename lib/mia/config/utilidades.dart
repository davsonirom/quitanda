import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:quitanda/mia/config/desing.dart';

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

  //! toast
  void exibirToast(String mensagem) {
    Fluttertoast.showToast(
        msg: mensagem,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Desing.corContraste,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
