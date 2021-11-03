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
  String toString() {
    return '''
alfabetoIndex: ${alfabetoIndex},
reservas: ${reservas},
reservasAssento: ${reservasAssento},
assentosSelecionados: ${assentosSelecionados},
teste: ${teste},
assentosReservaAtual: ${assentosReservaAtual},
reservasUsuario: ${reservasUsuario},
loading: ${loading},
isValid: ${isValid},
valorTotalReserva: ${valorTotalReserva}
    ''';
  }
}
