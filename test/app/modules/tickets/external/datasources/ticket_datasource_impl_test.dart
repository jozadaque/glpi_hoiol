import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/core/constants/constants.dart';
import 'package:glpi_hoiol/app/modules/tickets/external/datasources/ticket_datasource_impl.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late TicketDatasourceImpl datasource;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;
    datasource = TicketDatasourceImpl(dio);
  });

  test('Should return a lista of Categories', () async {
    dioAdapter.onGet(
      '$appUrl/ITILCategory',
      (server) => server.reply(200, jsonDecode(categories),
          delay: const Duration(seconds: 1)),
    );

    final response = await datasource.getCategories();

    expect(response.length, 3);
  });
}

String categories = r'''[
  {
    "id": 1,
    "entities_id": 0,
    "is_recursive": 0,
    "itilcategories_id": 0,
    "name": "Computador - Falha",
    "completename": "Computador - Falha",
    "comment": "",
    "level": 1,
    "knowbaseitemcategories_id": 0,
    "users_id": 0,
    "groups_id": 0,
    "code": "",
    "ancestors_cache": "[]",
    "sons_cache": null,
    "is_helpdeskvisible": 1,
    "tickettemplates_id_incident": 0,
    "tickettemplates_id_demand": 0,
    "changetemplates_id": 0,
    "problemtemplates_id": 0,
    "is_incident": 1,
    "is_request": 1,
    "is_problem": 1,
    "is_change": 1,
    "date_mod": "2022-10-09 15:30:16",
    "date_creation": "2022-10-09 15:30:16",
    "links": [
      {
        "rel": "Entity",
        "href": "https://jozadaqueglpi.000webhostapp.com/glpi/apirest.php/Entity/0"
      }
    ]
  },
  {
    "id": 2,
    "entities_id": 0,
    "is_recursive": 0,
    "itilcategories_id": 0,
    "name": "Nobreak - falha",
    "completename": "Nobreak - falha",
    "comment": "",
    "level": 1,
    "knowbaseitemcategories_id": 0,
    "users_id": 0,
    "groups_id": 0,
    "code": "",
    "ancestors_cache": "[]",
    "sons_cache": null,
    "is_helpdeskvisible": 1,
    "tickettemplates_id_incident": 0,
    "tickettemplates_id_demand": 0,
    "changetemplates_id": 0,
    "problemtemplates_id": 0,
    "is_incident": 1,
    "is_request": 1,
    "is_problem": 1,
    "is_change": 1,
    "date_mod": "2022-10-09 15:33:27",
    "date_creation": "2022-10-09 15:33:27",
    "links": [
      {
        "rel": "Entity",
        "href": "https://jozadaqueglpi.000webhostapp.com/glpi/apirest.php/Entity/0"
      }
    ]
  },
  {
    "id": 3,
    "entities_id": 0,
    "is_recursive": 0,
    "itilcategories_id": 0,
    "name": "Criação de Usuario",
    "completename": "Criação de Usuario",
    "comment": "",
    "level": 1,
    "knowbaseitemcategories_id": 0,
    "users_id": 0,
    "groups_id": 0,
    "code": "",
    "ancestors_cache": "[]",
    "sons_cache": null,
    "is_helpdeskvisible": 1,
    "tickettemplates_id_incident": 0,
    "tickettemplates_id_demand": 0,
    "changetemplates_id": 0,
    "problemtemplates_id": 0,
    "is_incident": 1,
    "is_request": 1,
    "is_problem": 1,
    "is_change": 1,
    "date_mod": "2022-10-09 15:34:35",
    "date_creation": "2022-10-09 15:34:35",
    "links": [
      {
        "rel": "Entity",
        "href": "https://jozadaqueglpi.000webhostapp.com/glpi/apirest.php/Entity/0"
      }
    ]
  }
]''';
