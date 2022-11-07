import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/models/product_category/product_category_model.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class ShopRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== Product Categories ====================
  Future<Either<MainFailures, List<ProductCategoryModel>>> productCategories({
    required int shopId,
  }) async {
    try {
      final FormData form = FormData.fromMap({"shopid": shopId});

      final Response response = await dio.post(
        ApiEndpoints.productCategories,
        data: form,
      );

      log('response == ${response.data.toString()}',
          name: 'Product Categories');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final List<ProductCategoryModel> shops =
              (result['shopcategories'] as List)
                  .map((shop) => ProductCategoryModel.fromJson(shop))
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
}
