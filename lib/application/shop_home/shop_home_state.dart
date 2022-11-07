import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/advertisement/advertisement_model.dart';
import 'package:whatsapp_shop/domain/models/product/product_model.dart';

part 'shop_home_state.freezed.dart';

@freezed
class ShopHomeState with _$ShopHomeState {
  const factory ShopHomeState({
    required bool isLoading,
    required bool isError,
    @Default([]) List<AdvertisementModel> mainBanners,
    @Default([]) List<AdvertisementModel> footerBanners,
    @Default([]) List<ProductModel> trendingProducts,
    @Default([]) List<ProductModel> featuredProducts,
    @Default([]) List<ProductModel> popularProducts,
  }) = _ShopHomeState;

  factory ShopHomeState.initial() =>
      const ShopHomeState(isLoading: false, isError: false);
}
