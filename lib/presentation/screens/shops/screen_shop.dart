import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/product_category/product_category_event.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_event.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/provider/shop/shop_provider.dart';
import 'package:whatsapp_shop/domain/utils/refresh/refresh_utils.dart';
import 'package:whatsapp_shop/presentation/screens/shops/widgets/shop_product_category_list_widget.dart';
import 'package:whatsapp_shop/presentation/screens/shops/widgets/shop_product_list_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/errors/errors.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class ScreenShop extends ConsumerWidget {
  const ScreenShop({super.key, required this.shopId});

  final int shopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopHomeState state = ref.watch(
        ShopProvider.shopHomeProvider(ShopHomeEvent.shopHome(shopId: shopId)));

    return WillPopScope(
      onWillPop: () async {
        RefreshUtils.refreshShop(ref);
        return true;
      },
      child: Scaffold(
        backgroundColor: state.isError ? kWhite : kBackgroundColor,
        body: SafeArea(
          child: state.isError
              ? const SomethingWentWrongWidget()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      //==================== Advertisement Slider ====================
                      Consumer(
                        builder: (context, ref, _) {
                          //===== Loading =====
                          if (state.isLoading) {
                            return ShimmerWidget(
                                child: Container(
                                    color: kWhite,
                                    height: 200,
                                    width: double.infinity));
                          }

                          //===== Success =====
                          return ImageSlideshow(
                            autoPlayInterval: 3000,
                            isLoop: true,
                            children: [
                              Image.network(
                                'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                fit: BoxFit.cover,
                              ),
                            ],
                          );
                        },
                      ),

                      //==================== Product Categories Field ====================
                      Consumer(
                        builder: (context, ref, _) {
                          final state =
                              ref.watch(ShopProvider.productCategoriesProvider(
                            ProductCategoryEvent.categories(shopId: shopId),
                          ));

                          if (!state.isLoading &&
                                  state.productCategories.isEmpty ||
                              state.isError) {
                            return kNone;
                          }

                          return ShopProductCategoryList(
                            title: 'Top Categories',
                            productCategories: state.productCategories,
                            shimmer: state.isLoading,
                          );
                        },
                      ),
                      kHeight1,

                      //==================== Featured Products Field ====================
                      Consumer(
                        builder: (context, ref, _) {
                          if (!state.isLoading &&
                              state.featuredProducts.isEmpty) {
                            return kNone;
                          }
                          return ShopProductList(
                            title: 'Featured Products',
                            products: state.featuredProducts,
                            shimmer: state.isLoading,
                          );
                        },
                      ),
                      kHeight1,

                      //==================== Advertisement Slider ====================
                      Consumer(
                        builder: (context, ref, _) {
                          //===== Loading =====
                          if (state.isLoading) {
                            return ShimmerWidget(
                                child: Container(
                                    color: kWhite,
                                    height: 200,
                                    width: double.infinity));
                          }
                          //===== Success =====
                          return ImageSlideshow(
                            autoPlayInterval: 3000,
                            isLoop: true,
                            children: [
                              Image.network(
                                'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                fit: BoxFit.cover,
                              ),
                            ],
                          );
                        },
                      ),
                      kHeight1,

                      //==================== Trending Products Field ====================
                      Consumer(
                        builder: (context, ref, _) {
                          if (!state.isLoading &&
                              state.trendingProducts.isEmpty) {
                            return kNone;
                          }
                          return ShopProductList(
                            title: 'Trending Products',
                            products: state.trendingProducts,
                            shimmer: state.isLoading,
                          );
                        },
                      ),
                      kHeight1,

                      //==================== Advertisement Slider ====================
                      Consumer(
                        builder: (context, ref, _) {
                          //===== Loading =====
                          if (state.isLoading) {
                            return ShimmerWidget(
                                child: Container(
                                    color: kWhite,
                                    height: 200,
                                    width: double.infinity));
                          }
                          //===== Success =====
                          return ImageSlideshow(
                            autoPlayInterval: 3000,
                            isLoop: true,
                            children: [
                              Image.network(
                                'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                fit: BoxFit.cover,
                              ),
                            ],
                          );
                        },
                      ),
                      kHeight1,

                      //==================== Newest Products Field ====================
                      Consumer(
                        builder: (context, ref, _) {
                          if (!state.isLoading &&
                              state.popularProducts.isEmpty) {
                            return kNone;
                          }
                          return ShopProductList(
                            title: 'Popular Products',
                            products: state.popularProducts,
                            shimmer: state.isLoading,
                          );
                        },
                      ),
                      kHeight1,
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
