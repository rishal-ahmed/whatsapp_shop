import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/models/cart/cart_model.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class CartRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== Carts ====================
  Future<Either<MainFailures, List<CartModel>>> carts({
    required int userId,
  }) async {
    try {
      final FormData form = FormData.fromMap({"userid": userId});

      final Response response = await dio.post(
        ApiEndpoints.carts,
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Carts');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final List<CartModel> carts = (result['cart'] as List)
              .map((cart) => CartModel.fromJson(cart))
              .toList();

          return Right(carts);
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

  //==================== Add Cart ====================
  Future<Either<MainFailures, bool>> addCart({
    required int userId,
    required int productId,
    required int unitId,
    required int quantity,
  }) async {
    try {
      final FormData form = FormData.fromMap({
        "userid": userId,
        "productid": productId,
        "unitid": unitId,
        "quantity": quantity,
      });

      final Response response = await dio.post(
        ApiEndpoints.addCart,
        data: form,
        options: Options(
            // will not throw errors
            // validateStatus: (status) => true,
            ),
      );

      log('response == ${response.data.toString()}', name: 'Add Cart');

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
      log('Exception : $e');
      log('StackTrace  : $s');
      return const Left(MainFailures.clientFailure());
    }
  }

  //==================== Cart Count ====================
  Future<Either<MainFailures, int>> cartCount({required int userId}) async {
    try {
      final FormData form = FormData.fromMap({"userid": userId});

      final Response response = await dio.post(
        ApiEndpoints.cartCount,
        data: form,
        options: Options(
            // will not throw errors
            // validateStatus: (status) => true,
            ),
      );

      log('response == ${response.data.toString()}', name: 'Cart Count');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final int cartCount = result['count'];
          return Right(cartCount);
        } else {
          return const Left(MainFailures.clientFailure());
        }
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e, s) {
      log('Exception : $e');
      log('StackTrace  : $s');
      return const Left(MainFailures.clientFailure());
    }
  }
}
