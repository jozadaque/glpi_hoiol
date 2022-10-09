import 'package:flutter_modular/flutter_modular.dart';

import 'modules/tickets/ticket_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: TicketModule()),
        ModuleRoute('/ticket/', module: TicketModule()),
      ];
}
