import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/models/advertisement/advertisement_model.dart';
import 'package:whatsapp_shop/domain/models/shop/shop_model.dart';
import 'package:whatsapp_shop/domain/models/shop_category/shop_category_model.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class HomeRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== Home ====================
  Future<Either<MainFailures, Map<String, dynamic>>> get home async {
    try {
      final Response response = await dio.get(ApiEndpoints.home);

      log('response == ${response.data.toString()}', name: 'Home');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final List<ShopCategoryModel> shopCategories = (result[
                  'shopcategories'] as List)
              .map((shopCategory) => ShopCategoryModel.fromJson(shopCategory))
              .toList();

          final List<ShopModel> hotelsRestaurants =
              (result['Hotels & Restaurant'] as List)
                  .map((e) => ShopModel.fromJson(e))
                  .toList();
          final List<ShopModel> superMarkets = (result['Supermarket'] as List)
              .map((e) => ShopModel.fromJson(e))
              .toList();
          final List<ShopModel> otherShops = (result['othershops'] as List)
              .map((e) => ShopModel.fromJson(e))
              .toList();
          final List<ShopModel> newShops = (result['newshops'] as List)
              .map((e) => ShopModel.fromJson(e))
              .toList();
          final List<AdvertisementModel> firstAd = (result['firstad'] as List)
              .map((e) => AdvertisementModel.fromJson(e))
              .toList();
          final List<AdvertisementModel> secondAd = (result['secondad'] as List)
              .map((e) => AdvertisementModel.fromJson(e))
              .toList();

          final Map<String, dynamic> res = {
            'shop_categories': shopCategories,
            'hotels_restaurants': hotelsRestaurants,
            'super_markets': superMarkets,
            'other_shops': otherShops,
            'new_shops': newShops,
            'first_ads': firstAd,
            'second_ads': secondAd,
          };

          return Right(res);
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

  //==================== Search Home ====================
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
