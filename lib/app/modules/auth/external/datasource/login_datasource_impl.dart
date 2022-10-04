import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';
import '../../../../core/constants/app_constants.dart';
import 'package:glpi_hoiol/app/modules/auth/infra/datasources/i_login_datasource.dart';

class LoginDatasourceImpl implements ILoginDatasource {
  final Dio dio;

  LoginDatasourceImpl(this.dio);

  @override
  Future<String> login(Params params) async {
    String basicauth =
        base64Encode(utf8.encode('${params.user}:${params.password}'));

    try {
      final response = await dio.get('$appUrl/initSession',
          options: Options(headers: {'Authorization': 'Basic $basicauth'}));

      return response.data['session_token'];
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return throw Exception('Bad Request');
        } else if (e.response!.statusCode == 401) {
          return throw Exception('UNAUTHORIZED');
        }
      }
      return throw Exception();
    }
  }

  @override
  Future<String> logout(
    String authToken,
  ) async {
    try {
      final response = await dio.get('$appUrl/killSession',
          options: Options(headers: {'Session-Token': authToken}));

      return response.statusCode.toString();
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          return throw Exception('Bad Request');
        }
      }
      return throw Exception();
    }
  }
}
