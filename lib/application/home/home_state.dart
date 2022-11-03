import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/advertisement/advertisement_model.dart';
import 'package:whatsapp_shop/domain/models/shop/shop_model.dart';
import 'package:whatsapp_shop/domain/models/shop_category/shop_category_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required bool isLoading,
    required bool isError,
    @Default([]) List<ShopCategoryModel> shopCategories,
    @Default([]) List<ShopModel> hotelsRestaurants,
    @Default([]) List<ShopModel> superMarkets,
    @Default([]) List<ShopModel> otherShops,
    @Default([]) List<ShopModel> newShops,
    @Default([]) List<AdvertisementModel> firstAds,
    @Default([]) List<AdvertisementModel> secondAds,
  }) = _HomeState;
  const HomeState._();

  factory HomeState.initial() => HomeState(isLoading: false, isError: false);
}
