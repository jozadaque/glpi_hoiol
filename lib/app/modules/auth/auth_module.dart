import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/repositories/i_login_repository.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:glpi_hoiol/app/modules/auth/external/datasource/login_datasource_impl.dart';
import 'package:glpi_hoiol/app/modules/auth/infra/datasources/i_login_datasource.dart';
import 'package:glpi_hoiol/app/modules/auth/infra/repositories/login_repository_impl.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/pages/login_page.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/login_bloc/login_bloc.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Dio()),
        Bind.factory<ILoginDatasource>((i) => LoginDatasourceImpl((i)())),
        Bind.factory<IloginRepository>((i) => LoginRepositoryImpl((i)())),
        Bind.factory<ILoginUsecase>((i) => LoginUsecaseImpl((i)())),
        Bind.singleton((i) => LoginBloc((i)())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
      ];
}
