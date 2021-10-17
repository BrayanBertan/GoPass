import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/helpers/extensions.dart';
import 'package:gopass_app/models/usuario_model.dart';
import 'package:gopass_app/repositories/usuario_repository.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  final usuarioRepository = Modular.get<UsuarioRepository>();
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
  DateTime? nascimento = DateTime.now();

  @observable
  String? foto;

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  void setNome(String value) => nome = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setSenha(String value) => senha = value;

  @action
  void setSenhaC(String value) => senhaC = value;

  @action
  void setCpf(String value) => cpf = value;

  @action
  void setFoto(String value) => foto = value;

  @action
  void setNascimento(DateTime value) => nascimento = value;

  @action
  Future<void> signUp() async {
    try {
      loading = true;
      var retorno = await usuarioRepository.saveUsuario(Usuario(
          nome: nome,
          email: email,
          senha: senha,
          cpf: cpf,
          foto: foto,
          nascimento: nascimento));
      loading = false;
      print(retorno.toString());
      print(retorno.id);
    } catch (e) {
      print(e);
    }
  }

  @computed
  bool get nomeValid => nome != null && nome!.length > 6;
  String? get nomeError {
    if (nome == null || nomeValid)
      return null;
    else if (nome!.trim().isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  var format = DateFormat('dd/MM/yyyy');
  @computed
  String get formatNascimento => format.format(nascimento!);

  @computed
  String? get emailError {
    if (email == null || emailValid)
      return null;
    else if (email!.trim().isEmpty)
      return 'Campo obrigatório';
    else
      return 'Email invalido';
  }

  @computed
  bool get cpfValid => cpf != null && cpf!.length >= 11;

  @computed
  String? get cpfError {
    if (cpf == null || cpfValid)
      return null;
    else if (cpf!.trim().isEmpty)
      return 'Campo obrigatório';
    else
      return 'cpf invalido';
  }

  @computed
  bool get senhaValid => senha != null && senha!.length > 6;

  @computed
  String? get senhaError {
    if (senha == null || senhaValid)
      return null;
    else if (senha!.trim().isEmpty)
      return 'Campo obrigatório';
    else
      return 'senha invalida';
  }

  @computed
  bool get senhaCValid => senhaC != null && senha == senhaC;

  @computed
  String? get senhaCError {
    if (senhaCValid)
      return null;
    else if (senha != senhaC && senhaC != null)
      return 'as senhas são diferentes';
  }

  @computed
  bool get isFormValid =>
      emailValid && nomeValid && cpfValid && senhaValid && senhaCValid;
}
