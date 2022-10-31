import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/models/user_model.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class LoginRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== User Login ====================
  Future<Either<MainFailures, UserModel>> login(
      {required String username, required String password}) async {
    try {
      final FormData form =
          FormData.fromMap({'emailormobile': username, 'password': password});

      final Response response = await dio.post(
        ApiEndpoints.login,
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Login');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '00') {
          return const Left(MainFailures.clientFailure());
        } else {
          final UserModel userModel = UserModel.fromJson(result['user']);
          return Right(userModel);
        }
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log('Exception : $e');
      return const Left(MainFailures.clientFailure());
    }
  }
}
