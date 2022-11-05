import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:glpi_hoiol/app/modules/tickets/external/driver/html_convert.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/ticket_entity.dart';

import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/pages/widgets/button_widget.dart';

import '../../../external/driver/html_convert.dart';

class TicketPage extends StatefulWidget {
  final Ticket ticket;

  const TicketPage({super.key, required this.ticket});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Ticket ${widget.ticket.id}'),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      widget.ticket.name,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child:
                      HtmlWidget(HtmlConverte.converter(widget.ticket.content)),
                ),
                Padding(
                  padding: const EdgeInsets.all(29.0),
                  child: ButtonWidget(
                      label: 'Voltar',
                      onPressed: () {
                        Modular.to.navigate('/');
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
