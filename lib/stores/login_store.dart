import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/repositories/usuario_repository.dart';
import 'package:gopass_app/stores/usuario_store.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final usuarioRepository = Modular.get<UsuarioRepository>();
  final usuarioStore = Modular.get<UsuarioStore>();
  @observable
  String email = '';

  @observable
  String senha = '';

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  void setEmail(String value) => email = value;

  @action
  void setSenha(String value) => senha = value;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  Future<void> login() async {
    try {
      isLoading = true;
      var retorno = await usuarioRepository.getUsuario(email, senha);
      error = null;
      if (retorno == null) error = 'Dados incorretos!';
      usuarioStore.setUser(retorno);
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }
}
