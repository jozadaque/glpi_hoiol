import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/core/constants/app_constants.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/errors/tickets_erros.dart';
import 'package:glpi_hoiol/app/modules/tickets/external/datasources/ticket_datasource_impl.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/ticket_entity.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'categories_json.dart';
import 'category_ticket_json.dart';
import 'tickets_json.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late TicketDatasourceImpl datasource;

  setUpAll(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;
    datasource = TicketDatasourceImpl(dio);
  });

  group('TicketDataSourceImpl - Success', () {
    test('Should return a lista of Categories with  length == 21', () async {
      dioAdapter.onGet(
        '$appUrl/ITILCategory',
        (server) => server.reply(200, jsonDecode(categories),
            delay: const Duration(seconds: 1)),
      );

      final response = await datasource.getCategories();

      expect(response.length, 21);
    });

    test(
        'Should return "NOBREAK - FALHA/DEFEITO" when id == 1 in categoryById method',
        () async {
      dioAdapter.onGet(
        '$appUrl/ITILCategory/7',
        (server) => server.reply(200, jsonDecode(category),
            delay: const Duration(seconds: 1)),
      );

      final response = await datasource.getCategoryById(7);

      expect(response.name, "NOBREAK - FALHA/DEFEITO");
    });

    test(
        'Should return "Nobreak Não esta Funcionando" when id == 1 in ticketById method',
        () async {
      dioAdapter.onGet(
        '$appUrl/Ticket/1',
        (server) => server.reply(200, jsonDecode(ticket),
            delay: const Duration(seconds: 1)),
      );

      for (var i = 0; i < 50; i++) {
        dioAdapter.onGet(
          '$appUrl/ITILCategory/$i',
          (server) => server.reply(200, jsonDecode(category),
              delay: const Duration(seconds: 1)),
        );
      }

      final Ticket response = await datasource.getTicketById(1);

      expect(response.name, 'Nobreak Não esta Funcionando');
    });

    test('Should return a lista of Tickts with  length == 21', () async {
      dioAdapter.onGet(
        '$appUrl/Ticket',
        (server) => server.reply(200, jsonDecode(tickets),
            delay: const Duration(seconds: 1)),
      );

      final response = await datasource.getTickets();

      expect(response.length, 30);
    });
  });

  group('TicketDataSourceImpl - Fail', () {
    test('Should return a NotFoundedError to getTickets method', () async {
      dioAdapter.onGet(
        '$appUrl/Ticket?order=DESC',
        (server) => server.reply(0, null, delay: const Duration(seconds: 1)),
      );

      expect(datasource.getTickets(), throwsA(isA<NotFoundedError>()));
    });

    test('Should return a ErrorNotAuth to getTickets method when status == 401',
        () async {
      dioAdapter.onGet(
        '$appUrl/Ticket',
        (server) => server.reply(401, null, delay: const Duration(seconds: 1)),
      );

      expect(datasource.getTickets(), throwsA(isA<ErrorNotAuth>()));
    });

//*
    test('Should return a NotFoundedError to getCategories method', () async {
      dioAdapter.onGet(
        '$appUrl/ITILCategory',
        (server) => server.reply(0, null, delay: const Duration(seconds: 1)),
      );

      expect(datasource.getCategories(), throwsA(isA<NotFoundedError>()));
    });

    test(
        'Should return a ErrorNotAuth to getCategories method when status == 401',
        () async {
      dioAdapter.onGet(
        '$appUrl/ITILCategory',
        (server) => server.reply(401, null, delay: const Duration(seconds: 1)),
      );

      expect(datasource.getCategories(), throwsA(isA<ErrorNotAuth>()));
    });

//*

    test('Should return a NotFoundedError to getTicketById method', () async {
      dioAdapter.onGet(
        '$appUrl/Ticket/0)',
        (server) => server.reply(0, null, delay: const Duration(seconds: 1)),
      );

      expect(datasource.getTicketById(0), throwsA(isA<NotFoundedError>()));
    });

    test(
        'Should return a ErrorNotAuth to getTicketById method when status == 401',
        () async {
      dioAdapter.onGet(
        '$appUrl/Ticket/1',
        (server) => server.reply(401, null, delay: const Duration(seconds: 1)),
      );

      expect(datasource.getTicketById(1), throwsA(isA<ErrorNotAuth>()));
    });

    test(
        'Should return a TicketError to getTicketById method when status == 404',
        () async {
      dioAdapter.onGet(
        '$appUrl/Ticket/1',
        (server) => server.reply(404, null, delay: const Duration(seconds: 1)),
      );

      expect(datasource.getTicketById(1), throwsA(isA<TicketError>()));
    });

    //*

    test('Should return a NotFoundedError to getCategoryById method', () async {
      dioAdapter.onGet(
        '$appUrl/ITILCategory/1',
        (server) => server.reply(0, null, delay: const Duration(seconds: 1)),
      );

      expect(datasource.getCategoryById(1), throwsA(isA<NotFoundedError>()));
    });

    test(
        'Should return a CategoryError to getCategoryById method when status == 401',
        () async {
      dioAdapter.onGet(
        '$appUrl/ITILCategory/0',
        (server) => server.reply(401, null, delay: const Duration(seconds: 1)),
      );

      expect(datasource.getCategoryById(0), throwsA(isA<ErrorNotAuth>()));
    });

    test(
        'Should return a CategoryError to getCategoryById method when status == 404',
        () async {
      dioAdapter.onGet(
        '$appUrl/ITILCategory/0',
        (server) => server.reply(404, null, delay: const Duration(seconds: 1)),
      );

      expect(datasource.getCategoryById(0), throwsA(isA<CategoryError>()));
    });
  });
}
