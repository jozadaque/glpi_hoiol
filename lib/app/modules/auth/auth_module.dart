import 'package:flutter_modular/flutter_modular.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/pages/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const LoginPage())];
}
