import 'package:flutter/rendering.dart';

const String appUrl = 'http://191.7.192.130:11040/ti/apirest.php';
String authToken = 'u6t1f912k9l3t4men85j5pgple';

final status = {
  1: 'Novo',
  2: 'Processando',
  3: 'Processando Agendado',
  4: 'Pendente',
  5: 'Fechado',
  6: 'Encerrado',
};

final prioriyColor = {
  1: const Color.fromARGB(125, 250, 247, 255),
  2: const Color.fromARGB(124, 206, 241, 5),
  3: const Color.fromARGB(124, 252, 5, 5),
  4: const Color.fromARGB(124, 39, 170, 13),
  5: const Color.fromARGB(124, 0, 247, 255),
};
