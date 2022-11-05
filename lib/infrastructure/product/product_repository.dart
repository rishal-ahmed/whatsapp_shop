import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/models/shop/shop_model.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class HomeRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== Search Product ====================
  Future<Either<MainFailures, List<ShopModel>>> search({
    required String shopCategoryId,
    required String keyword,
  }) async {
    log('shopCategoryId = $shopCategoryId');
    log('keyword = $keyword');

    try {
      final FormData form = FormData.fromMap(
        {"shopcategoryid": shopCategoryId, "keyword": keyword},
      );

      final Response response = await dio.post(
        ApiEndpoints.searchHome,
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Search Home');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          List<ShopModel> shops = [];
          if (result['shops'] is List) {
            shops = (result['shops'] as List)
                .map((shop) => ShopModel.fromJson(shop))
                .toList();
          }

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
