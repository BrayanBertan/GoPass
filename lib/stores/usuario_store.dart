import 'package:gopass_app/models/usuario_model.dart';
import 'package:mobx/mobx.dart';

part 'usuario_store.g.dart';

class UsuarioStore = _UsuarioStore with _$UsuarioStore;

abstract class _UsuarioStore with Store {
  @observable
  Usuario? usuario;

  @observable
  String? foto;

  @action
  void setUser(Usuario? value) {
    usuario = value;
    if (usuario != null) foto = usuario!.foto;
  }

  @computed
  bool get isLoggedIn => usuario != null;

  void logout() {
    setUser(null);
    print('null $usuario');
  }
}
