import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../auth/presenter/pages/widgets/button_logout.dart';
import '../../../../auth/presenter/ui/bloc/logout_bloc/logout_bloc.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Chamados'),
        actions: const [ButtonLogoutWidget()],
      ),
    );
  }
}
