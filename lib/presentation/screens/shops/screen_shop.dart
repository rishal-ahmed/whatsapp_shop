import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/product_category/product_category_event.dart';
import 'package:whatsapp_shop/application/product_category/product_category_notifier.dart';
import 'package:whatsapp_shop/application/product_category/product_category_state.dart';
import 'package:whatsapp_shop/application/products/products_event.dart';
import 'package:whatsapp_shop/application/products/products_notifier.dart';
import 'package:whatsapp_shop/application/products/products_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/screens/shops/widgets/shop_product_category_list_widget.dart';
import 'package:whatsapp_shop/presentation/screens/shops/widgets/shop_product_list_widget.dart';

final _productCategoriesProvider = StateNotifierProvider.family<
    ProductCategoryNotifier,
    ProductCategoryState,
    ProductCategoryEvent>((ref, event) {
  return ProductCategoryNotifier()
    ..emit(ProductCategoryEvent.categories(shopId: event.shopId));
});

final _productsProvider = StateNotifierProvider.family<ProductsNotifier,
    ProductsState, ProductsEvent>((ref, event) {
  return ProductsNotifier()
    ..emit(ProductsEvent.products(shopId: event.shopId, filter: event.filter));
});

class ScreenShop extends StatelessWidget {
  const ScreenShop({super.key, required this.shopId});

  final int shopId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //==================== Advertisement Slider ====================
            Consumer(
              builder: (context, ref, _) {
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
                final state = ref.watch(_productCategoriesProvider(
                    ProductCategoryEvent.categories(shopId: shopId)));

                if (state.isLoading) {
                  return SizedBox(
                    height: 18.h,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (state.isError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                if (state.productCategories.isEmpty) {
                  return kNone;
                }

                return ShopProductCategoryList(
                  title: 'Top Categories',
                  productCategories: state.productCategories,
                );
              },
            ),
            kHeight1,

            //==================== Featured Products Field ====================
            Consumer(
              builder: (context, ref, _) {
                final state = ref.watch(_productsProvider(
                    ProductsEvent.products(
                        shopId: shopId, filter: 'featured')));

                if (state.isLoading) {
                  return SizedBox(
                    height: 18.h,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (state.isError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                if (state.products.isEmpty) {
                  return kNone;
                }
                return ShopProductList(
                    title: 'Featured Products', products: state.products);
              },
            ),
            kHeight1,

            //==================== Advertisement Slider ====================
            Consumer(
              builder: (context, ref, _) {
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
                final state = ref.watch(_productsProvider(
                    ProductsEvent.products(
                        shopId: shopId, filter: 'trending')));

                if (state.isLoading) {
                  return SizedBox(
                    height: 18.h,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (state.isError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                if (state.products.isEmpty) {
                  return kNone;
                }
                return ShopProductList(
                    title: 'Trending Products', products: state.products);
              },
            ),
            kHeight1,

            //==================== Advertisement Slider ====================
            Consumer(
              builder: (context, ref, _) {
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
                final state = ref.watch(_productsProvider(
                    ProductsEvent.products(shopId: shopId, filter: 'newest')));

                if (state.isLoading) {
                  return SizedBox(
                    height: 18.h,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (state.isError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                if (state.products.isEmpty) {
                  return kNone;
                }
                return ShopProductList(
                    title: 'Newest Products', products: state.products);
              },
            ),
            kHeight1,
          ],
        ),
      ),
    );
  }
}
