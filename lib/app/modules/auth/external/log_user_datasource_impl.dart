import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';
import 'package:dartz/dartz.dart';
import 'package:glpi_hoiol/app/modules/auth/infra/datasources/i_log_user_datasource.dart';

class LogUserDatasourceImpl implements ILogUserDatasource {
  final Dio dio;
  final String url;

  LogUserDatasourceImpl({
    required this.dio,
    required this.url,
  });

  @override
  Future<Either<Exception, String?>> login(Params params) async {
    try {
      String basicauth =
          base64Encode(utf8.encode('${params.user}:${params.password}'));

      final response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Basic $basicauth'}));

      return response.data['session_token'];
    } on DioError catch (e) {
      if (e.response != null) {
        return left(Exception());
      } else {
        return left(Exception());
      }
    }
  }

  @override
  Future<Either<Exception, Unit>> logout(
    String authToken,
  ) async {
    try {
      await dio.get(url,
          options: Options(headers: {'Session-Token': authToken}));

      return const Right(unit);
    } on DioError catch (e) {
      if (e.response != null) {
        return left(Exception());
      } else {
        return left(Exception());
      }
    }
  }
}
