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
  1: const Color.fromARGB(124, 167, 212, 95),
  2: const Color.fromARGB(124, 206, 241, 5),
  3: const Color.fromARGB(123, 170, 197, 135),
  4: const Color.fromARGB(151, 224, 13, 13),
  5: const Color.fromARGB(124, 0, 247, 255),
};

final prioriyStatus = {
  1: 'Muito Baixa',
  2: 'Baixa',
  3: 'Media',
  4: 'Alta',
  5: 'Muito Alta',
};
