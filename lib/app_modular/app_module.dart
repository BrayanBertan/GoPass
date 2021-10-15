import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/views/login_view.dart';
import 'package:gopass_app/views/splash_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SplashScreen()),
        ChildRoute('/login', child: (_, __) => LoginPage()),
      ];
}
