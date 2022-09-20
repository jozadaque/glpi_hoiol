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
  });

  group('Success LogUserDatasourceImpl:', () {
    test('Should return a String when login method is called', () async {
      dio.httpClientAdapter = dioAdapter;

      when(() => params.user).thenReturn('user');
      when(() => params.password).thenReturn('passs');

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
