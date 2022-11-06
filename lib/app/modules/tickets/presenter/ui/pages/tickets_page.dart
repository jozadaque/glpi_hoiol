import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/logout_bloc/logout_bloc.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/logout_bloc/logout_event.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/tickets_bloc/ticket_event.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/tickets_bloc/ticket_state.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/app_constants.dart';
import '../bloc/tickets_bloc/ticket_bloc.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  late TicketBloc blocTickets;
  late LogoutBloc bloclogin;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR');
    blocTickets = Modular.get<TicketBloc>();
    bloclogin = Modular.get<LogoutBloc>();
    blocTickets.add(GetTickets());
  }

  @override
  void dispose() {
    blocTickets.close();
    bloclogin.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Chamados'),
        actions: [
          IconButton(
              onPressed: () {
                bloclogin.add(LogoutEvent(authToken));
                authToken = '';
                Modular.to.pushNamed('/');
              },
              icon: const Icon(Icons.power_settings_new))
        ],
      ),
      body: BlocBuilder<TicketBloc, TicketState>(
          bloc: blocTickets,
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
                  (i) => Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: ListTile(
                      leading: Text(state.tickets[i].id.toString()),
                      title: Text(state.tickets[i].name),
                      trailing: Container(
                        decoration: BoxDecoration(
                            color: prioriyColor[state.tickets[i].priority],
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(3),
                        width: 50,
                        height: 30,
                        child: Center(
                          child: Text(prioriyStatus[state.tickets[i].priority]
                              .toString()),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text(state.tickets[i].status),
                            const SizedBox(width: 10),
                            Text(DateFormat.yMMMMd('pt_BR')
                                .format(DateTime.parse(state.tickets[i].date))
                                .toString()),
                          ],
                        ),
                      ),
                      dense: false,
                      isThreeLine: true,
                      horizontalTitleGap: 4,
                      onTap: () {
                        Modular.to.pushNamed('/tickets/ticket/',
                            arguments: state.tickets[i]);
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
              );
            }
            return Container();
          }),
    );
  }
}
