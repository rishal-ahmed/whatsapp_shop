import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/models/advertisement/advertisement_model.dart';
import 'package:whatsapp_shop/domain/models/product/product_model.dart';
import 'package:whatsapp_shop/domain/models/product_category/product_category_model.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class ShopRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== Shop Home ====================
  Future<Either<MainFailures, Map<String, dynamic>>> shopHome(
      {required int shopId}) async {
    try {
      log('========================================= Shop Home Repository =========================================');

      final FormData form = FormData.fromMap({"shopid": shopId});

      final Response response = await dio.post(
        ApiEndpoints.shopHome,
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Shop Home');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final List<AdvertisementModel> mainBanners = (result['mainbanners']
                  as List)
              .map((shopCategory) => AdvertisementModel.fromJson(shopCategory))
              .toList();

          final List<AdvertisementModel> footerBanners = (result[
                  'footerbanners'] as List)
              .map((shopCategory) => AdvertisementModel.fromJson(shopCategory))
              .toList();

          final List<ProductModel> trendingProducts =
              (result['trendingproducts'] as List)
                  .map((e) => ProductModel.fromJson(e))
                  .toList();

          final List<ProductModel> featuredProducts =
              (result['featuredproducts'] as List)
                  .map((e) => ProductModel.fromJson(e))
                  .toList();
          final List<ProductModel> popularProducts =
              (result['popularproducts'] as List)
                  .map((e) => ProductModel.fromJson(e))
                  .toList();

          final Map<String, dynamic> res = {
            'main_banners': mainBanners,
            'footer_banners': footerBanners,
            'trending_products': trendingProducts,
            'featured_products': featuredProducts,
            'popular_products': popularProducts,
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

  //==================== Products ====================
  Future<Either<MainFailures, List<ProductModel>>> products({
    required int shopId,
    required String filter,
  }) async {
    try {
      final FormData form = FormData.fromMap({
        "shopid": shopId,
        "filter": filter,
      });

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

  //==================== Search Products ====================
  Future<Either<MainFailures, List<ProductModel>>> searchProducts({
    required int shopId,
    int categoryId = 0,
    required String keyword,
  }) async {
    try {
      final FormData form = FormData.fromMap(
        {"shopid": shopId, "categoryid": categoryId, "keyword": keyword},
      );

      final Response response = await dio.post(
        ApiEndpoints.searchProducts,
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Search Products');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          List<ProductModel> shops = [];
          if (result['shops'] is List) {
            shops = (result['shops'] as List)
                .map((shop) => ProductModel.fromJson(shop))
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
