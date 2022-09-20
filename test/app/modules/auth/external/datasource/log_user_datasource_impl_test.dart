import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/modules/auth/external/datasource/log_user_datasource_impl.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../share/mocks/mocks.dart';

void main() {
  late Dio dio;
  late LogUserDatasourceImpl datasource;
  late MockParams params;

  late MockResponse response;

  //final dio = Dio();
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio();

    dioAdapter = DioAdapter(dio: dio);

    params = MockParams();
    response = MockResponse();
  });

  group('Success LogUserDatasourceImpl:', () {
    test('Should return a String', () async {
      dio.httpClientAdapter = dioAdapter;

      when(() => params.user).thenReturn('jozadaque_sousa');
      when(() => params.password).thenReturn('@Daque15');

      dioAdapter.onGet(
          'path',
          (request) => request.reply(200, {'session_token': 'dsdsdsdsdsdsdsf'},
              delay: const Duration(seconds: 1)));

      datasource = LogUserDatasourceImpl(dio: dio, url: 'path');

      final result = await datasource.login(params);

      expect(result, isA<String>());
    });
  });
}

class MockResponse extends Mock implements Response {}
