// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupStore on _SignupStore, Store {
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
error: ${error}
    ''';
  }
}
