class Reserva {
  int? id;
  int? evento_id;
  int? usuario_id;
  DateTime? data_reserva;
  int? confirmada;
  String? modo_pagamento;
  String? evento;
  DateTime? data_evento;
  double? valor;
  String? foto;
  int? qtde_ingressos;
  int? total_vendido;
  int? lotacao_minima;

  Reserva(
      {this.evento_id,
      this.usuario_id,
      this.data_reserva,
      this.confirmada,
      this.modo_pagamento});

  Reserva.fromMap(Map map) {
    id = map['id'];
    evento_id = map['evento_id'];
    usuario_id = map['usuario_id'];
    confirmada = map['confirmada'];
    modo_pagamento = map['modo_pagamento'];
    lotacao_minima = map['lotacao_minima'];
    foto = modo_pagamento = map['foto'];
    data_reserva =
        DateTime.fromMillisecondsSinceEpoch(map['data_reserva'] * 1000);
    data_evento =
        DateTime.fromMillisecondsSinceEpoch(map['data_evento'] * 1000);
    evento = map['evento'];
    valor = map['valor'];
    qtde_ingressos = map['qtde_ingressos'];
    total_vendido = map['total_vendido'];
  }

  Map<String, Object?> toMap() {
    Map<String, dynamic>? map = {
      'evento_id': evento_id,
      'usuario_id': usuario_id,
      'confirmada': confirmada,
      'modo_pagamento': modo_pagamento,
      'data_reserva': ((data_reserva)!.millisecondsSinceEpoch / 1000).round(),
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "id: $total_vendido";
  }
}
