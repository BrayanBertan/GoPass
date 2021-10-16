// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupStore on _SignupStore, Store {
  Computed<bool>? _$nomeValidComputed;

  @override
  bool get nomeValid => (_$nomeValidComputed ??=
          Computed<bool>(() => super.nomeValid, name: '_SignupStore.nomeValid'))
      .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignupStore.emailValid'))
          .value;
  Computed<String>? _$formatNascimentoComputed;

  @override
  String get formatNascimento => (_$formatNascimentoComputed ??=
          Computed<String>(() => super.formatNascimento,
              name: '_SignupStore.formatNascimento'))
      .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_SignupStore.emailError'))
          .value;
  Computed<bool>? _$cpfValidComputed;

  @override
  bool get cpfValid => (_$cpfValidComputed ??=
          Computed<bool>(() => super.cpfValid, name: '_SignupStore.cpfValid'))
      .value;
  Computed<String?>? _$cpfErrorComputed;

  @override
  String? get cpfError =>
      (_$cpfErrorComputed ??= Computed<String?>(() => super.cpfError,
              name: '_SignupStore.cpfError'))
          .value;
  Computed<bool>? _$senhaValidComputed;

  @override
  bool get senhaValid =>
      (_$senhaValidComputed ??= Computed<bool>(() => super.senhaValid,
              name: '_SignupStore.senhaValid'))
          .value;
  Computed<String?>? _$senhaErrorComputed;

  @override
  String? get senhaError =>
      (_$senhaErrorComputed ??= Computed<String?>(() => super.senhaError,
              name: '_SignupStore.senhaError'))
          .value;
  Computed<bool>? _$senhaCValidComputed;

  @override
  bool get senhaCValid =>
      (_$senhaCValidComputed ??= Computed<bool>(() => super.senhaCValid,
              name: '_SignupStore.senhaCValid'))
          .value;
  Computed<String?>? _$senhaCErrorComputed;

  @override
  String? get senhaCError =>
      (_$senhaCErrorComputed ??= Computed<String?>(() => super.senhaCError,
              name: '_SignupStore.senhaCError'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignupStore.isFormValid'))
          .value;

  final _$nomeAtom = Atom(name: '_SignupStore.nome');

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

  final _$emailAtom = Atom(name: '_SignupStore.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$cpfAtom = Atom(name: '_SignupStore.cpf');

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$senhaAtom = Atom(name: '_SignupStore.senha');

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$senhaCAtom = Atom(name: '_SignupStore.senhaC');

  @override
  String? get senhaC {
    _$senhaCAtom.reportRead();
    return super.senhaC;
  }

  @override
  set senhaC(String? value) {
    _$senhaCAtom.reportWrite(value, super.senhaC, () {
      super.senhaC = value;
    });
  }

  final _$nascimentoAtom = Atom(name: '_SignupStore.nascimento');

  @override
  DateTime? get nascimento {
    _$nascimentoAtom.reportRead();
    return super.nascimento;
  }

  @override
  set nascimento(DateTime? value) {
    _$nascimentoAtom.reportWrite(value, super.nascimento, () {
      super.nascimento = value;
    });
  }

  final _$fotoAtom = Atom(name: '_SignupStore.foto');

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

  final _$loadingAtom = Atom(name: '_SignupStore.loading');

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

  final _$errorAtom = Atom(name: '_SignupStore.error');

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

  final _$signUpAsyncAction = AsyncAction('_SignupStore.signUp');

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_SignupStoreActionController = ActionController(name: '_SignupStore');

  @override
  void setNome(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenhaC(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setSenhaC');
    try {
      return super.setSenhaC(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo =
        _$_SignupStoreActionController.startAction(name: '_SignupStore.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFoto(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setFoto');
    try {
      return super.setFoto(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNascimento(DateTime value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setNascimento');
    try {
      return super.setNascimento(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
cpf: ${cpf},
senha: ${senha},
senhaC: ${senhaC},
nascimento: ${nascimento},
foto: ${foto},
loading: ${loading},
error: ${error},
nomeValid: ${nomeValid},
emailValid: ${emailValid},
formatNascimento: ${formatNascimento},
emailError: ${emailError},
cpfValid: ${cpfValid},
cpfError: ${cpfError},
senhaValid: ${senhaValid},
senhaError: ${senhaError},
senhaCValid: ${senhaCValid},
senhaCError: ${senhaCError},
isFormValid: ${isFormValid}
    ''';
  }
}
