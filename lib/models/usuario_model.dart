class Usuario {
  int? id;
  String? nome;
  String? email;
  String? senha;
  String? foto;
  String? cpf;
  String tipo = 'C';
  DateTime? nascimento;

  Usuario(
      {this.nome,
      this.email,
      this.senha,
      this.foto,
      this.cpf,
      this.nascimento});

  Usuario.fromMap(Map map) {
    id    = map['id'];
    nome  = map['nome'];
    foto  = map['foto'];
    cpf   = map['cpf'];
    email = map['email'];
    senha = map['senha'];
    tipo  = map['tipo'];
    nascimento = DateTime.fromMillisecondsSinceEpoch(map['nascimento'] * 1000);
  }

  Map<String, Object?> toMap() {
    Map<String, dynamic>? map = {
      'nome': nome,
      'email': email,
      'foto': foto,
      'cpf': cpf,
      'senha': senha,
      'tipo': tipo,
      'nascimento': ((nascimento)!.millisecondsSinceEpoch / 1000).round(),
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "id: $id Nome: $nome foto: $foto";
  }
}
