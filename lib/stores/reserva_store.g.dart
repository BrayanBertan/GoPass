// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserva_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReservaStore on _ReservaStore, Store {
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

  final _$getAllReservaSAsyncAction =
      AsyncAction('_ReservaStore.getAllReservaS');

  @override
  Future<void> getAllReservaS(int evento) {
    return _$getAllReservaSAsyncAction.run(() => super.getAllReservaS(evento));
  }

  final _$_ReservaStoreActionController =
      ActionController(name: '_ReservaStore');

  @override
  dynamic setAssentosSelecionados(int assento) {
    final _$actionInfo = _$_ReservaStoreActionController.startAction(
        name: '_ReservaStore.setAssentosSelecionados');
    try {
      return super.setAssentosSelecionados(assento);
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
assentosSelecionados: ${assentosSelecionados}
    ''';
  }
}
