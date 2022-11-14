import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class OrderRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== Order ====================
  Future<Either<MainFailures, bool>> order({
    required int userId,
    required int shopId,
    required int addressId,
    required String paymentType,
    required String promoCode,
    required num discount,
    required num deliveryCharge,
  }) async {
    try {
      final FormData form = FormData.fromMap({
        "userid": userId,
        "shopid": shopId,
        "type": paymentType,
        "addressid": addressId,
        "promocode": promoCode,
        "discount": discount,
        "deliverycharge": deliveryCharge
      });

      final Response response = await dio.post(
        ApiEndpoints.order,
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Order');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          return const Right(true);
        } else {
          return const Left(MainFailures.clientFailure());
        }
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e, s) {
      log('Exception : $e', stackTrace: s);
      return const Left(MainFailures.clientFailure());
    }
  }
}
