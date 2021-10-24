class Reserva {
  int? id;
  int? evento_id;
  int? usuario_id;
  int? assento_id;
  DateTime? data_reserva;
  int? confirmada;
  String? modo_pagamento;

  Reserva(
      {this.evento_id,
      this.usuario_id,
      this.assento_id,
      this.data_reserva,
      this.confirmada,
      this.modo_pagamento});

  Reserva.fromMap(Map map) {
    id              = map['id'];
    evento_id       = map['evento_id'];
    usuario_id      = map['usuario_id'];
    assento_id      = map['assento_id'];
    confirmada      = map['confirmada'];
    modo_pagamento  = map['modo_pagamento'];
    data_reserva    = DateTime.fromMillisecondsSinceEpoch(map['data_reserva'] * 1000);
  }

  Map<String, Object?> toMap() {
    Map<String, dynamic>? map = {
      'evento_id': evento_id,
      'usuario_id': usuario_id,
      'assento_id': assento_id,
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
    return "id: $id";
  }
}
