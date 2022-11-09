import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/models/product/product_model.dart';
import 'package:whatsapp_shop/domain/models/unit/unit_model.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class CartRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== Carts ====================
  Future<Either<MainFailures, List<ProductModel>>> carts({
    required int userId,
  }) async {
    try {
      final FormData form = FormData.fromMap({"userid": userId});

      final Response response = await dio.post(
        ApiEndpoints.products,
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Products');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final List<ProductModel> shops = (result['products'] as List)
              .map((shop) => ProductModel.fromJson(shop))
              .toList();

          return Right(shops);
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

  //==================== Product ====================
  Future<Either<MainFailures, Map<String, dynamic>>> product({
    required int productId,
  }) async {
    try {
      final Response response = await dio.post(
        ApiEndpoints.product + productId.toString(),
      );

      log('response == ${response.data.toString()}', name: 'Product');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final ProductModel product = ProductModel.fromJson(result['product']);

          final List<UnitModel> units = (result['units'] as List)
              .map((units) => UnitModel.fromJson(units))
              .toList();

          final String category = result['category'];
          final String seller = result['seller'];

          final List<ProductModel> similarProducts =
              (result['sproducts'] as List)
                  .map((e) => ProductModel.fromJson(e))
                  .toList();

          final Map<String, dynamic> res = {
            'product': product,
            'units': units,
            'category': category,
            'seller': seller,
            'similar_products': similarProducts,
          };

          return Right(res);
        } else {
          return const Left(MainFailures.clientFailure());
        }
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e, s) {
      log('Exception : $e');
      log('StackTrace : $s');

      return const Left(MainFailures.clientFailure());
    }
  }
}
