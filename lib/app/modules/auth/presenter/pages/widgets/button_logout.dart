import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../ui/bloc/logout_bloc/logout_bloc.dart';

class ButtonLogoutWidget extends StatefulWidget {
  const ButtonLogoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonLogoutWidget> createState() => _ButtonLogoutWidgetState();
}

class _ButtonLogoutWidgetState extends State<ButtonLogoutWidget> {
  late LogoutBloc logoutBloc;

  @override
  void dispose() {
    logoutBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    logoutBloc = Modular.get<LogoutBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          logoutBloc.logout.logout(authToken);
          Modular.to.pushReplacementNamed('/login/');
        },
        icon: const Icon(
          Icons.logout,
        ));
  }
}
