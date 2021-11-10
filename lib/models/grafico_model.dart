class GraficoBarra {
  String? eixoX;
  int? eixoY;

  GraficoBarra(this.eixoX, this.eixoY);

  GraficoBarra.fromMap(Map map) {
    eixoX = map['confirmada'] == 1
        ? 'confirmado'
        : DateTime.now()
                    .difference(DateTime.fromMillisecondsSinceEpoch(
                        map['data_reserva'] * 1000))
                    .inHours >
                24
            ? 'cancelado'
            : 'pendente';
    eixoY = map['qtd'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "eixoX: $eixoX eixoY: $eixoY";
  }
}
