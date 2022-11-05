import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/pages/ticket_page.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/pages/tickets_page.dart';

import '../auth/domain/repositories/i_login_repository.dart';
import '../auth/domain/usecases/login_usecase.dart';
import '../auth/external/datasource/login_datasource_impl.dart';
import '../auth/infra/datasources/i_login_datasource.dart';
import '../auth/infra/repositories/login_repository_impl.dart';
import '../auth/presenter/ui/bloc/logout_bloc/logout_bloc.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/repositories/i_ticket_repository.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/usecase/ticket_usecase.dart';
import 'package:glpi_hoiol/app/modules/tickets/external/datasources/ticket_datasource_impl.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/datasources/i_ticket_datasource.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/repositories/ticket_repository_impl.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/tickets_bloc/ticket_bloc.dart';

class TicketModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Dio()),
        Bind.factory<ILoginDatasource>((i) => LoginDatasourceImpl((i)())),
        Bind.factory<IloginRepository>((i) => LoginRepositoryImpl((i)())),
        Bind.factory<ILoginUsecase>((i) => LoginUsecaseImpl((i)())),
        Bind.singleton((i) => LogoutBloc((i)())),
        Bind.factory<ITicketDatasource>((i) => TicketDatasourceImpl(i())),
        Bind.factory<ITicketRepository>((i) => TicketRepositoryImpl(i())),
        Bind.factory<ITicketUsecase>((i) => TicketUsecase(i())),
        Bind.singleton((i) => TicketBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const TicketsPage()),
        ChildRoute('/ticket/',
            child: (context, args) => TicketPage(
                  ticket: args.data,
                )),
      ];
}
