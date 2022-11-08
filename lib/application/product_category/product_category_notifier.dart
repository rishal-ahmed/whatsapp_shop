import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/product_category/product_category_event.dart';
import 'package:whatsapp_shop/application/product_category/product_category_state.dart';
import 'package:whatsapp_shop/infrastructure/shop/shop_repository.dart';

class ProductCategoryNotifier extends StateNotifier<ProductCategoryState> {
  ProductCategoryNotifier() : super(ProductCategoryState.initial());

  void emit(ProductCategoryEvent event) {
    event.map(
      categories: (categoryEvent) async {
        // Loading
        state = ProductCategoryState.initial().copyWith(isLoading: true);

        // Product Categories Api
        final result = await ShopRepository()
            .productCategories(shopId: categoryEvent.shopId);

        final ProductCategoryState productCategoryState = result.fold(
          //=-=-=-=- Error -=-=-=-=-=
          (l) => ProductCategoryState.initial().copyWith(
            isError: true,
          ),
          //=-=-=-=- Success -=-=-=-=-=
          (r) {
            return ProductCategoryState.initial().copyWith(
              isError: true,
              productCategories: r,
            );
          },
        );

        // Notify UI
        state = productCategoryState;
      },
    );
  }
}
