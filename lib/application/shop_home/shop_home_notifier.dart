import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_event.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_state.dart';
import 'package:whatsapp_shop/infrastructure/shop/shop_repository.dart';

class ShopHomeNotifier extends StateNotifier<ShopHomeState> {
  ShopHomeNotifier() : super(ShopHomeState.initial());

  final ShopHomeState initialState = ShopHomeState.initial();

  void emit(ShopHomeEvent event) {
    event.map(
      shopHome: (homeEvent) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Shop Home Api
        final result =
            await ShopRepository().shopHome(shopId: homeEvent.shopId);

        final ShopHomeState shopHomeState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(
            isError: true,
          ),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(
            mainBanners: success['main_banners'],
            footerBanners: success['footer_banners'],
            trendingProducts: success['trending_products'],
            featuredProducts: success['featured_products'],
            popularProducts: success['popular_products'],
          ),
        );

        // Notify UI
        state = shopHomeState;
      },
    );
  }
}
