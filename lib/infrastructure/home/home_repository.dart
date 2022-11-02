import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/models/shop_category/shop_category_model.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class HomeRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== User Register ====================
  Future<Either<MainFailures, List<ShopCategoryModel>>> get home async {
    try {
      final Response response = await dio.get(ApiEndpoints.home);

      log('response == ${response.data.toString()}', name: 'Home');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final List shopCategories = result['shopcategories'];

          final List<ShopCategoryModel> shopCategoryModels = shopCategories
              .map((shopCategory) => ShopCategoryModel.fromJson(shopCategory))
              .toList();

          return Right(shopCategoryModels);
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
