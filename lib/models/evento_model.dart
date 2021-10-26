class Evento {
  int? id;
  int? categoria_id;
  int? usuario_id;
  String? nome;
  String descricao = '';
  String? endereco;
  DateTime? data_evento;
  int? lotacao_minima;
  int? lotacao_maxima;
  double? valor;
  String? foto;

  Evento(
      {this.categoria_id,
      this.usuario_id,
      this.nome,
      this.endereco,
      this.data_evento,
      this.lotacao_minima,
      this.lotacao_maxima,
      this.valor,
      this.foto});

  Evento.fromMap(Map map) {
    id = map['id'];
    categoria_id = map['categoria_id'];
    usuario_id = map['usuario_id'];
    nome = map['nome'];
    endereco = map['endereco'];
    data_evento =
        DateTime.fromMillisecondsSinceEpoch(map['data_evento'] * 1000);
    lotacao_minima = map['lotacao_minima'];
    lotacao_maxima = map['lotacao_maxima'];
    valor = map['valor'];
    foto = map['foto'];
  }

  Map<String, Object?> toMap() {
    Map<String, dynamic>? map = {
      'categoria_id': categoria_id,
      'usuario_id': usuario_id,
      'nome': nome,
      'endereco': endereco,
      'data_evento': ((data_evento)!.millisecondsSinceEpoch / 1000).round(),
      'lotacao_minima': lotacao_minima,
      'lotacao_maxima': lotacao_maxima,
      'valor': valor,
      'foto': foto
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "id: $id Nome: $nome categoria: $categoria_id";
  }
}
