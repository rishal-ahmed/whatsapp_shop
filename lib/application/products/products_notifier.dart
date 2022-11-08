import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/products/products_event.dart';
import 'package:whatsapp_shop/application/products/products_state.dart';
import 'package:whatsapp_shop/infrastructure/product/product_repository.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  ProductsNotifier() : super(ProductsState.initial());

  final ProductsState initialState = ProductsState.initial();

  void emit(ProductsEvent event) {
    event.map(
      products: (productsEvent) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Products Api
        final result = await ProductRepository().products(
            shopId: productsEvent.shopId, filter: productsEvent.filter);

        final ProductsState productsState = result.fold(
          (l) => initialState.copyWith(isError: true),
          (r) => initialState.copyWith(products: r),
        );

        // Notify UI
        state = productsState;
      },
    );
  }
}
