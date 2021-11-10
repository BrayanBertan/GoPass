// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserva_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReservaStore on _ReservaStore, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: '_ReservaStore.isValid'))
      .value;
  Computed<double>? _$valorTotalReservaComputed;

  @override
  double get valorTotalReserva => (_$valorTotalReservaComputed ??=
          Computed<double>(() => super.valorTotalReserva,
              name: '_ReservaStore.valorTotalReserva'))
      .value;

  final _$alfabetoIndexAtom = Atom(name: '_ReservaStore.alfabetoIndex');

  @override
  int get alfabetoIndex {
    _$alfabetoIndexAtom.reportRead();
    return super.alfabetoIndex;
  }

  @override
  set alfabetoIndex(int value) {
    _$alfabetoIndexAtom.reportWrite(value, super.alfabetoIndex, () {
      super.alfabetoIndex = value;
    });
  }

  final _$reservasAtom = Atom(name: '_ReservaStore.reservas');

  @override
  ObservableList<Reserva> get reservas {
    _$reservasAtom.reportRead();
    return super.reservas;
  }

  @override
  set reservas(ObservableList<Reserva> value) {
    _$reservasAtom.reportWrite(value, super.reservas, () {
      super.reservas = value;
    });
  }

  final _$reservasAssentoAtom = Atom(name: '_ReservaStore.reservasAssento');

  @override
  ObservableList<int> get reservasAssento {
    _$reservasAssentoAtom.reportRead();
    return super.reservasAssento;
  }

  @override
  set reservasAssento(ObservableList<int> value) {
    _$reservasAssentoAtom.reportWrite(value, super.reservasAssento, () {
      super.reservasAssento = value;
    });
  }

  final _$assentosSelecionadosAtom =
      Atom(name: '_ReservaStore.assentosSelecionados');

  @override
  ObservableList<int> get assentosSelecionados {
    _$assentosSelecionadosAtom.reportRead();
    return super.assentosSelecionados;
  }

  @override
  set assentosSelecionados(ObservableList<int> value) {
    _$assentosSelecionadosAtom.reportWrite(value, super.assentosSelecionados,
        () {
      super.assentosSelecionados = value;
    });
  }

  final _$testeAtom = Atom(name: '_ReservaStore.teste');

  @override
  ObservableList<Map<String, dynamic>> get teste {
    _$testeAtom.reportRead();
    return super.teste;
  }

  @override
  set teste(ObservableList<Map<String, dynamic>> value) {
    _$testeAtom.reportWrite(value, super.teste, () {
      super.teste = value;
    });
  }

  final _$assentosReservaAtualAtom =
      Atom(name: '_ReservaStore.assentosReservaAtual');

  @override
  ObservableList<Assento> get assentosReservaAtual {
    _$assentosReservaAtualAtom.reportRead();
    return super.assentosReservaAtual;
  }

  @override
  set assentosReservaAtual(ObservableList<Assento> value) {
    _$assentosReservaAtualAtom.reportWrite(value, super.assentosReservaAtual,
        () {
      super.assentosReservaAtual = value;
    });
  }

  final _$reservasUsuarioAtom = Atom(name: '_ReservaStore.reservasUsuario');

  @override
  ObservableList<Reserva> get reservasUsuario {
    _$reservasUsuarioAtom.reportRead();
    return super.reservasUsuario;
  }

  @override
  set reservasUsuario(ObservableList<Reserva> value) {
    _$reservasUsuarioAtom.reportWrite(value, super.reservasUsuario, () {
      super.reservasUsuario = value;
    });
  }

  final _$graficoAtom = Atom(name: '_ReservaStore.grafico');

  @override
  ObservableList<GraficoBarra> get grafico {
    _$graficoAtom.reportRead();
    return super.grafico;
  }

  @override
  set grafico(ObservableList<GraficoBarra> value) {
    _$graficoAtom.reportWrite(value, super.grafico, () {
      super.grafico = value;
    });
  }

  final _$quantidadeAtom = Atom(name: '_ReservaStore.quantidade');

  @override
  int get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  final _$quantidadeConfirmadoAtom =
      Atom(name: '_ReservaStore.quantidadeConfirmado');

  @override
  int get quantidadeConfirmado {
    _$quantidadeConfirmadoAtom.reportRead();
    return super.quantidadeConfirmado;
  }

  @override
  set quantidadeConfirmado(int value) {
    _$quantidadeConfirmadoAtom.reportWrite(value, super.quantidadeConfirmado,
        () {
      super.quantidadeConfirmado = value;
    });
  }

  final _$quantidadePendenteAtom =
      Atom(name: '_ReservaStore.quantidadePendente');

  @override
  int get quantidadePendente {
    _$quantidadePendenteAtom.reportRead();
    return super.quantidadePendente;
  }

  @override
  set quantidadePendente(int value) {
    _$quantidadePendenteAtom.reportWrite(value, super.quantidadePendente, () {
      super.quantidadePendente = value;
    });
  }

  final _$quantidadeCanceladoAtom =
      Atom(name: '_ReservaStore.quantidadeCancelado');

  @override
  int get quantidadeCancelado {
    _$quantidadeCanceladoAtom.reportRead();
    return super.quantidadeCancelado;
  }

  @override
  set quantidadeCancelado(int value) {
    _$quantidadeCanceladoAtom.reportWrite(value, super.quantidadeCancelado, () {
      super.quantidadeCancelado = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ReservaStore.loading');

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

  final _$loadingPagamentoAtom = Atom(name: '_ReservaStore.loadingPagamento');

  @override
  bool get loadingPagamento {
    _$loadingPagamentoAtom.reportRead();
    return super.loadingPagamento;
  }

  @override
  set loadingPagamento(bool value) {
    _$loadingPagamentoAtom.reportWrite(value, super.loadingPagamento, () {
      super.loadingPagamento = value;
    });
  }

  final _$modoDePagamentoAtom = Atom(name: '_ReservaStore.modoDePagamento');

  @override
  int get modoDePagamento {
    _$modoDePagamentoAtom.reportRead();
    return super.modoDePagamento;
  }

  @override
  set modoDePagamento(int value) {
    _$modoDePagamentoAtom.reportWrite(value, super.modoDePagamento, () {
      super.modoDePagamento = value;
    });
  }

  final _$getAllReservaSAsyncAction =
      AsyncAction('_ReservaStore.getAllReservaS');

  @override
  Future<void> getAllReservaS(int evento) {
    return _$getAllReservaSAsyncAction.run(() => super.getAllReservaS(evento));
  }

  final _$getAllReservasUsuarioAsyncAction =
      AsyncAction('_ReservaStore.getAllReservasUsuario');

  @override
  Future<void> getAllReservasUsuario() {
    return _$getAllReservasUsuarioAsyncAction
        .run(() => super.getAllReservasUsuario());
  }

  final _$getGraficoAsyncAction = AsyncAction('_ReservaStore.getGrafico');

  @override
  Future<void> getGrafico(int id) {
    return _$getGraficoAsyncAction.run(() => super.getGrafico(id));
  }

  final _$_ReservaStoreActionController =
      ActionController(name: '_ReservaStore');

  @override
  dynamic setAssentosSelecionados(int assento, String linha) {
    final _$actionInfo = _$_ReservaStoreActionController.startAction(
        name: '_ReservaStore.setAssentosSelecionados');
    try {
      return super.setAssentosSelecionados(assento, linha);
    } finally {
      _$_ReservaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addQuantidade(int qtd) {
    final _$actionInfo = _$_ReservaStoreActionController.startAction(
        name: '_ReservaStore.addQuantidade');
    try {
      return super.addQuantidade(qtd);
    } finally {
      _$_ReservaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addQuantidadeConfirmado(int qtd) {
    final _$actionInfo = _$_ReservaStoreActionController.startAction(
        name: '_ReservaStore.addQuantidadeConfirmado');
    try {
      return super.addQuantidadeConfirmado(qtd);
    } finally {
      _$_ReservaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addQuantidadePendente(int qtd) {
    final _$actionInfo = _$_ReservaStoreActionController.startAction(
        name: '_ReservaStore.addQuantidadePendente');
    try {
      return super.addQuantidadePendente(qtd);
    } finally {
      _$_ReservaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addQuantidadeCancelado(int qtd) {
    final _$actionInfo = _$_ReservaStoreActionController.startAction(
        name: '_ReservaStore.addQuantidadeCancelado');
    try {
      return super.addQuantidadeCancelado(qtd);
    } finally {
      _$_ReservaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetaQuantidade() {
    final _$actionInfo = _$_ReservaStoreActionController.startAction(
        name: '_ReservaStore.resetaQuantidade');
    try {
      return super.resetaQuantidade();
    } finally {
      _$_ReservaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoading(bool value) {
    final _$actionInfo = _$_ReservaStoreActionController.startAction(
        name: '_ReservaStore.isLoading');
    try {
      return super.isLoading(value);
    } finally {
      _$_ReservaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingPagamento(bool value) {
    final _$actionInfo = _$_ReservaStoreActionController.startAction(
        name: '_ReservaStore.isLoadingPagamento');
    try {
      return super.isLoadingPagamento(value);
    } finally {
      _$_ReservaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModoDePagamento(int value) {
    final _$actionInfo = _$_ReservaStoreActionController.startAction(
        name: '_ReservaStore.setModoDePagamento');
    try {
      return super.setModoDePagamento(value);
    } finally {
      _$_ReservaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
alfabetoIndex: ${alfabetoIndex},
reservas: ${reservas},
reservasAssento: ${reservasAssento},
assentosSelecionados: ${assentosSelecionados},
teste: ${teste},
assentosReservaAtual: ${assentosReservaAtual},
reservasUsuario: ${reservasUsuario},
grafico: ${grafico},
quantidade: ${quantidade},
quantidadeConfirmado: ${quantidadeConfirmado},
quantidadePendente: ${quantidadePendente},
quantidadeCancelado: ${quantidadeCancelado},
loading: ${loading},
loadingPagamento: ${loadingPagamento},
modoDePagamento: ${modoDePagamento},
isValid: ${isValid},
valorTotalReserva: ${valorTotalReserva}
    ''';
  }
}
