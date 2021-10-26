import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/repositories/banco_repository.dart';
import 'package:gopass_app/repositories/evento_repository.dart';
import 'package:gopass_app/repositories/usuario_repository.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:gopass_app/stores/filter_store.dart';
import 'package:gopass_app/stores/login_store.dart';
import 'package:gopass_app/stores/signup_store.dart';
import 'package:gopass_app/stores/usuario_store.dart';
import 'package:gopass_app/views/cadastro/cadastro_view.dart';
import 'package:gopass_app/views/eventos/home.dart';
import 'package:gopass_app/views/login_view.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SignupStore()),
        Bind((i) => LoginStore()),
        Bind.singleton((i) => EventoStore()),
        Bind.lazySingleton((i) => UsuarioStore()),
        Bind((i) => BancoRepository()),
        Bind((i) => UsuarioRepository()),
        Bind((i) => EventoRepository()),
        Bind.singleton((i) => FilterStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
        ChildRoute('/login', child: (_, __) => LoginPage()),
        ChildRoute('/cadastro', child: (_, __) => CadastroPage()),
        ChildRoute('/home', child: (_, __) => HomePage()),
      ];
}
