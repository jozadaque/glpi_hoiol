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
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    params = MockParams();
    dio.httpClientAdapter = dioAdapter;
  });

  group('Success LogUserDatasourceImpl:', () {
    test('Should return a token when login method is called', () async {
      when(() => params.user).thenReturn('user');
      when(() => params.password).thenReturn('passs');

      dioAdapter.onGet(
          'path',
          (request) => request.reply(200, {'session_token': 'anything'},
              delay: const Duration(seconds: 1)));

      datasource = LogUserDatasourceImpl(dio: dio, url: 'path');

      final session = await datasource.login(params);

      expect(session, isA<String>());
    });

    test('Should return  status 200 when logout method is called', () async {
      dioAdapter.onGet(
          'path',
          (request) =>
              request.reply(200, {}, delay: const Duration(seconds: 1)));

      datasource = LogUserDatasourceImpl(dio: dio, url: 'path');

      final status = await datasource.logout('authToken');

      expect(status, '200');
    });
  });

  group('Fail LogUserDatasourceImpl:', () {
    test(
        'should throw an exception to login method when the status code is 400',
        () async {
      when(() => params.user).thenReturn('user');
      when(() => params.password).thenReturn('passs');

      dioAdapter.onGet(
          'path',
          (request) =>
              request.reply(400, null, delay: const Duration(seconds: 1)));

      datasource = LogUserDatasourceImpl(dio: dio, url: 'path');

      expect(() async => await datasource.login(params),
          throwsA(isA<Exception>()));
    });

    test(
        'should throw an exception to login method when the status code is 401',
        () async {
      when(() => params.user).thenReturn('user');
      when(() => params.password).thenReturn('passs');

      dioAdapter.onGet('path', (request) => request.reply(401, null));

      datasource = LogUserDatasourceImpl(dio: dio, url: 'path');

      expect(() => datasource.login(params), throwsA(isA<Exception>()));
    });

    test(
        'should throw an exception to logout method when the status code is 400',
        () async {
      dioAdapter.onGet('path', (request) => request.reply(400, null));

      datasource = LogUserDatasourceImpl(dio: dio, url: 'path');

      expect(() => datasource.logout('authToken'), throwsA(isA<Exception>()));
    });
  });
}
