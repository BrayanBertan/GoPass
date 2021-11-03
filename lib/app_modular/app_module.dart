import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/repositories/assento_repository.dart';
import 'package:gopass_app/repositories/banco_repository.dart';
import 'package:gopass_app/repositories/evento_repository.dart';
import 'package:gopass_app/repositories/reserva_repository.dart';
import 'package:gopass_app/repositories/usuario_repository.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:gopass_app/stores/filter_store.dart';
import 'package:gopass_app/stores/login_store.dart';
import 'package:gopass_app/stores/reserva_store.dart';
import 'package:gopass_app/stores/signup_store.dart';
import 'package:gopass_app/stores/usuario_store.dart';
import 'package:gopass_app/views/cadastro/cadastro_view.dart';
import 'package:gopass_app/views/eventos/cadastro_view.dart';
import 'package:gopass_app/views/eventos/evento_info.dart';
import 'package:gopass_app/views/eventos/home.dart';
import 'package:gopass_app/views/eventos/meus_eventos.dart';
import 'package:gopass_app/views/login_view.dart';
import 'package:gopass_app/views/splash_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SignupStore()),
        Bind((i) => LoginStore()),
        Bind.lazySingleton((i) => EventoStore()),
        Bind.lazySingleton((i) => UsuarioStore()),
        Bind((i) => BancoRepository()),
        Bind((i) => UsuarioRepository()),
        Bind((i) => EventoRepository()),
        Bind((i) => ReservaRepository()),
        Bind((i) => AssentoRepository()),
        Bind.singleton((i) => FilterStore()),
        Bind.singleton((i) => ReservaStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SplashScreen()),
        ChildRoute('/login', child: (_, __) => LoginPage()),
        ChildRoute('/cadastro', child: (_, __) => CadastroPage()),
        ChildRoute('/home', child: (_, __) => HomePage()),
        ChildRoute('/cadastro-evento', child: (_, __) => EventoCadastroPage()),
        ChildRoute('/meus_eventos', child: (_, __) => MeusEventosPage()),
        ChildRoute(
          '/evento-info',
          child: (_, args) => EventoInfoPage(args.data),
        ),
      ];
}
