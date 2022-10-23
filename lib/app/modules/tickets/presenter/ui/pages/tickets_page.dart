import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/ticket_bloc/ticket_event.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/ticket_bloc/ticket_state.dart';
import '../bloc/ticket_bloc/ticket_bloc.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  late TicketBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<TicketBloc>();
    bloc.add(GetTickets());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Chamados'),
      ),
      body: BlocBuilder<TicketBloc, TicketState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is InitialTicketState) {
              return const Text('GLPI');
            }
            if (state is ExceptionTicketState) {
              return Center(
                child: Text(state.exception.message.toString()),
              );
            }
            if (state is LoadingTicketState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SuccessTicketState) {
              return ListView(
                children: List.generate(
                    state.tickets.length,
                    (i) => ListTile(
                          title: Text(state.tickets[i].name),
                        )),
              );
            }
            return Container();
          }),
    );
  }
}
