import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/repositories/banco_repository.dart';
import 'package:gopass_app/repositories/usuario_repository.dart';
import 'package:gopass_app/stores/signup_store.dart';
import 'package:gopass_app/views/cadastro/cadastro_view.dart';
import 'package:gopass_app/views/login_view.dart';
import 'package:gopass_app/views/splash_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SignupStore()),
        Bind((i) => BancoRepository()),
        Bind((i) => UsuarioRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SplashScreen()),
        ChildRoute('/login', child: (_, __) => LoginPage()),
        ChildRoute('/cadastro', child: (_, __) => CadastroPage()),
      ];
}
