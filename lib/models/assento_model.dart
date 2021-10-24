class Assento {
  int? id;
  int? evento_id;
  int? usuario_id;
  DateTime? data_reserva;
  int? confirmada;
  String? modo_pagamento;

  Assento(
      {this.evento_id,
      this.usuario_id,
      this.data_reserva,
      this.confirmada,
      this.modo_pagamento
      });

  Assento.fromMap(Map map) {
    id             = map['id'];
    evento_id      = map['evento_id'];
    usuario_id     = map['usuario_id'];
    data_reserva   = DateTime.fromMillisecondsSinceEpoch(map['nascimento'] * 1000);
    confirmada     = map['confirmada'];
    modo_pagamento = map['modo_pagamento'];
  }

  Map<String, Object?> toMap() {
    Map<String, dynamic>? map = {
      'evento_id': evento_id,
      'usuario_id': usuario_id,
      'data_reserva': ((data_reserva)!.millisecondsSinceEpoch / 1000).round(),
      'confirmada': confirmada,
      'modo_pagamento': modo_pagamento
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
