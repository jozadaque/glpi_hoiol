import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';

import 'package:glpi_hoiol/app/modules/auth/infra/datasources/i_log_user_datasource.dart';

class LogUserDatasourceImpl implements ILogUserDatasource {
  final Dio dio;
  final String url;

  LogUserDatasourceImpl({
    required this.dio,
    required this.url,
  });

  @override
  Future<String> login(Params params) async {
    String basicauth =
        base64Encode(utf8.encode('${params.user}:${params.password}'));

    final response = await dio.get(url,
        options: Options(headers: {'Authorization': 'Basic $basicauth'}));

    if (response.statusCode == 200) {
      return response.data['session_token'];
    } else if (response.statusCode == 400) {
      return throw Exception('Bad Request');
    } else if (response.statusCode == 401) {
      return throw Exception('UNAUTHORIZED');
    } else {
      return throw Exception();
    }
  }

  @override
  Future<String> logout(
    String authToken,
  ) async {
    final response = await dio.get(url,
        options: Options(headers: {'Session-Token': authToken}));

    if (response.statusCode == 200) {
      return response.statusCode.toString();
    } else if (response.statusCode == 400) {
      return throw Exception('Bad Request');
    } else {
      return throw Exception();
    }
  }
}
