class Assento {
  int? id;
  int? reserva_id;
  int? numero;

  Assento({this.reserva_id, this.numero});

  Assento.fromMap(Map map) {
    id = map['id'];
    reserva_id = map['reserva_id'];
    numero = map['numero'];
  }

  Map<String, Object?> toMap() {
    Map<String, dynamic>? map = {
      'reserva_id': reserva_id,
      'numero': numero,
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
