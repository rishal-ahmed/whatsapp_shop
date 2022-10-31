import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/models/user_model.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class RegisterRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== User Register ====================
  Future<Either<MainFailures, UserModel>> register(
      {required String name,
      required String mobile,
      required String email,
      required String password}) async {
    try {
      final FormData form = FormData.fromMap({
        "name": name,
        "phone": mobile,
        "email": email,
        "password": password,
      });

      final Response response = await dio.post(
        ApiEndpoints.register,
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Register');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final UserModel userModel = UserModel.fromJson(result['user']);
          return Right(userModel);
        } else {
          return const Left(MainFailures.clientFailure());
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
