import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  @observable
  String? nome;

  @observable
  String? email;

  @observable
  String? cpf;

  @observable
  String? senha;

  @observable
  String? senhaC;

  @observable
  DateTime? nascimento;

  @observable
  String? foto;

  @observable
  bool loading = false;

  @observable
  String? error;
}
