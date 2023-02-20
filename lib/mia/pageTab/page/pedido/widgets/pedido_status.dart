// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quitanda/mia/config/desing.dart';

class PedidoStatus extends StatelessWidget {
  PedidoStatus({
    Key? key,
    required this.status,
    required this.taVencido,
  }) : super(key: key);
  final String status;
  final bool taVencido;

  // status
  final Map<String, int> todosStatus = <String, int>{
    'pagamento_pendente': 0,
    'pagamento_recusado': 1,
    'pagamento_recebido': 2,
    'preparando_pedido': 3,
    'enviado': 4,
    'entregue': 5,
  };

  int get statuAtual => todosStatus[status]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDetalhes(ativo: true, legenda: 'Pedido confirmado'),
        const _Sepador(),
        if (statuAtual == 1) ...[
          const _StatusDetalhes(
            ativo: true,
            legenda: 'Pagamento estornado',
            corDeStatus: Colors.orange,
          ),
        ] else if (taVencido) ...[
          const _StatusDetalhes(
            ativo: true,
            legenda: 'Pagamento vencido',
            corDeStatus: Colors.red,
          ),
        ] else ...[
          _StatusDetalhes(
            ativo: statuAtual >= 2,
            legenda: 'Pagamento',
          ),
          const _Sepador(),
          _StatusDetalhes(
            ativo: statuAtual >= 3,
            legenda: 'Preparando',
          ),
          const _Sepador(),
          _StatusDetalhes(
            ativo: statuAtual >= 4,
            legenda: 'Enviado',
          ),
          const _Sepador(),
          _StatusDetalhes(
            ativo: statuAtual == 5,
            legenda: 'Entregue',
          ),
        ]
      ],
    );
  }
}

class _StatusDetalhes extends StatelessWidget {
  const _StatusDetalhes({
    Key? key,
    required this.ativo,
    required this.legenda,
    this.corDeStatus,
  }) : super(key: key);

  final bool ativo;
  final String legenda;
  final Color? corDeStatus;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Desing.corPrimariaComSwacth,
            ),
            color: ativo
                ? corDeStatus ?? Desing.corPrimariaComSwacth
                : Colors.transparent,
          ),
          child: ativo
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 13,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(width: 5),
        // text descricao
        Expanded(
            child: Text(
          legenda,
          style: const TextStyle(
            fontSize: 12,
          ),
        )),
      ],
    );
  }
}

class _Sepador extends StatelessWidget {
  const _Sepador();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}
