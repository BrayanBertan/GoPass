// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventoStore on _EventoStore, Store {
  Computed<bool>? _$nomeValidComputed;

  @override
  bool get nomeValid => (_$nomeValidComputed ??=
          Computed<bool>(() => super.nomeValid, name: '_EventoStore.nomeValid'))
      .value;
  Computed<bool>? _$precoValidComputed;

  @override
  bool get precoValid =>
      (_$precoValidComputed ??= Computed<bool>(() => super.precoValid,
              name: '_EventoStore.precoValid'))
          .value;
  Computed<String>? _$formartDataEventoComputed;

  @override
  String get formartDataEvento => (_$formartDataEventoComputed ??=
          Computed<String>(() => super.formartDataEvento,
              name: '_EventoStore.formartDataEvento'))
      .value;
  Computed<String?>? _$precoErrorComputed;

  @override
  String? get precoError =>
      (_$precoErrorComputed ??= Computed<String?>(() => super.precoError,
              name: '_EventoStore.precoError'))
          .value;
  Computed<bool>? _$enderecoValidComputed;

  @override
  bool get enderecoValid =>
      (_$enderecoValidComputed ??= Computed<bool>(() => super.enderecoValid,
              name: '_EventoStore.enderecoValid'))
          .value;
  Computed<String?>? _$enderecoErrorComputed;

  @override
  String? get enderecoError =>
      (_$enderecoErrorComputed ??= Computed<String?>(() => super.enderecoError,
              name: '_EventoStore.enderecoError'))
          .value;
  Computed<bool>? _$descricaoValidComputed;

  @override
  bool get descricaoValid =>
      (_$descricaoValidComputed ??= Computed<bool>(() => super.descricaoValid,
              name: '_EventoStore.descricaoValid'))
          .value;
  Computed<String?>? _$descricaoErrorComputed;

  @override
  String? get descricaoError => (_$descricaoErrorComputed ??= Computed<String?>(
          () => super.descricaoError,
          name: '_EventoStore.descricaoError'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_EventoStore.isFormValid'))
          .value;

  final _$searchAtom = Atom(name: '_EventoStore.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$filterAtom = Atom(name: '_EventoStore.filter');

  @override
  FilterStore get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(FilterStore value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$nomeAtom = Atom(name: '_EventoStore.nome');

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$lotacaoAtom = Atom(name: '_EventoStore.lotacao');

  @override
  RangeValues get lotacao {
    _$lotacaoAtom.reportRead();
    return super.lotacao;
  }

  @override
  set lotacao(RangeValues value) {
    _$lotacaoAtom.reportWrite(value, super.lotacao, () {
      super.lotacao = value;
    });
  }

  final _$categoriaAtom = Atom(name: '_EventoStore.categoria');

  @override
  int? get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(int? value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  final _$enderecoAtom = Atom(name: '_EventoStore.endereco');

  @override
  String? get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(String? value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_EventoStore.descricao');

  @override
  String? get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String? value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$precoAtom = Atom(name: '_EventoStore.preco');

  @override
  double? get preco {
    _$precoAtom.reportRead();
    return super.preco;
  }

  @override
  set preco(double? value) {
    _$precoAtom.reportWrite(value, super.preco, () {
      super.preco = value;
    });
  }

  final _$dataEventoAtom = Atom(name: '_EventoStore.dataEvento');

  @override
  DateTime? get dataEvento {
    _$dataEventoAtom.reportRead();
    return super.dataEvento;
  }

  @override
  set dataEvento(DateTime? value) {
    _$dataEventoAtom.reportWrite(value, super.dataEvento, () {
      super.dataEvento = value;
    });
  }

  final _$categoriasAtom = Atom(name: '_EventoStore.categorias');

  @override
  ObservableList<Categoria> get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(ObservableList<Categoria> value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  final _$fotoAtom = Atom(name: '_EventoStore.foto');

  @override
  String? get foto {
    _$fotoAtom.reportRead();
    return super.foto;
  }

  @override
  set foto(String? value) {
    _$fotoAtom.reportWrite(value, super.foto, () {
      super.foto = value;
    });
  }

  final _$loadingAtom = Atom(name: '_EventoStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_EventoStore.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$getAllCategoriasAsyncAction =
      AsyncAction('_EventoStore.getAllCategorias');

  @override
  Future getAllCategorias() {
    return _$getAllCategoriasAsyncAction.run(() => super.getAllCategorias());
  }

  final _$getAllEventosAsyncAction = AsyncAction('_EventoStore.getAllEventos');

  @override
  Future getAllEventos() {
    return _$getAllEventosAsyncAction.run(() => super.getAllEventos());
  }

  final _$cadastroAsyncAction = AsyncAction('_EventoStore.cadastro');

  @override
  Future<void> cadastro() {
    return _$cadastroAsyncAction.run(() => super.cadastro());
  }

  final _$_EventoStoreActionController = ActionController(name: '_EventoStore');

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(FilterStore value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isLoading(bool value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.isLoading');
    try {
      return super.isLoading(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLotacao(RangeValues value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.setLotacao');
    try {
      return super.setLotacao(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategoria(int value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.setCategoria');
    try {
      return super.setCategoria(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndereco(String value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.setEndereco');
    try {
      return super.setEndereco(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPreco(String value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.setPreco');
    try {
      return super.setPreco(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setData(DateTime value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.setData');
    try {
      return super.setData(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFoto(String value) {
    final _$actionInfo = _$_EventoStoreActionController.startAction(
        name: '_EventoStore.setFoto');
    try {
      return super.setFoto(value);
    } finally {
      _$_EventoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
filter: ${filter},
nome: ${nome},
lotacao: ${lotacao},
categoria: ${categoria},
endereco: ${endereco},
descricao: ${descricao},
preco: ${preco},
dataEvento: ${dataEvento},
categorias: ${categorias},
foto: ${foto},
loading: ${loading},
error: ${error},
nomeValid: ${nomeValid},
precoValid: ${precoValid},
formartDataEvento: ${formartDataEvento},
precoError: ${precoError},
enderecoValid: ${enderecoValid},
enderecoError: ${enderecoError},
descricaoValid: ${descricaoValid},
descricaoError: ${descricaoError},
isFormValid: ${isFormValid}
    ''';
  }
}
