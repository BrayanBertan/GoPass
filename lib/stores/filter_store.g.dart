// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterStore on _FilterStore, Store {
  Computed<String>? _$formatInicialComputed;

  @override
  String get formatInicial =>
      (_$formatInicialComputed ??= Computed<String>(() => super.formatInicial,
              name: '_FilterStore.formatInicial'))
          .value;
  Computed<String>? _$formatFinalComputed;

  @override
  String get formatFinal =>
      (_$formatFinalComputed ??= Computed<String>(() => super.formatFinal,
              name: '_FilterStore.formatFinal'))
          .value;

  final _$dataFinalAtom = Atom(name: '_FilterStore.dataFinal');

  @override
  DateTime? get dataFinal {
    _$dataFinalAtom.reportRead();
    return super.dataFinal;
  }

  @override
  set dataFinal(DateTime? value) {
    _$dataFinalAtom.reportWrite(value, super.dataFinal, () {
      super.dataFinal = value;
    });
  }

  final _$precoMaxAtom = Atom(name: '_FilterStore.precoMax');

  @override
  double? get precoMax {
    _$precoMaxAtom.reportRead();
    return super.precoMax;
  }

  @override
  set precoMax(double? value) {
    _$precoMaxAtom.reportWrite(value, super.precoMax, () {
      super.precoMax = value;
    });
  }

  final _$dataInicialAtom = Atom(name: '_FilterStore.dataInicial');

  @override
  DateTime? get dataInicial {
    _$dataInicialAtom.reportRead();
    return super.dataInicial;
  }

  @override
  set dataInicial(DateTime? value) {
    _$dataInicialAtom.reportWrite(value, super.dataInicial, () {
      super.dataInicial = value;
    });
  }

  final _$getAllCategoriasAsyncAction =
      AsyncAction('_FilterStore.getAllCategorias');

  @override
  Future getAllCategorias() {
    return _$getAllCategoriasAsyncAction.run(() => super.getAllCategorias());
  }

  final _$_FilterStoreActionController = ActionController(name: '_FilterStore');

  @override
  void setDataFinal(DateTime value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setDataFinal');
    try {
      return super.setDataFinal(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrecoMax(double value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setPrecoMax');
    try {
      return super.setPrecoMax(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataInicial(DateTime value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setDataInicial');
    try {
      return super.setDataInicial(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategorias(List<dynamic> lista) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setCategorias');
    try {
      return super.setCategorias(lista);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelecionados(dynamic lista) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setSelecionados');
    try {
      return super.setSelecionados(lista);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataFinal: ${dataFinal},
precoMax: ${precoMax},
dataInicial: ${dataInicial},
formatInicial: ${formatInicial},
formatFinal: ${formatFinal}
    ''';
  }
}
