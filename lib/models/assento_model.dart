class Assento {
  int? id;
  int? reserva_id;
  int? numero;
  String? fileira;
  Assento({this.reserva_id, this.numero, this.fileira});

  Assento.fromMap(Map map) {
    id = map['id'];
    reserva_id = map['reserva_id'];
    numero = map['numero'];
    fileira = map['fileira'];
  }

  Map<String, Object?> toMap() {
    Map<String, dynamic>? map = {
      'reserva_id': reserva_id,
      'numero': numero,
      'fileira': fileira,
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
