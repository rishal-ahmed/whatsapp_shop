import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/product/product_event.dart';
import 'package:whatsapp_shop/application/product/product_state.dart';
import 'package:whatsapp_shop/infrastructure/product/product_repository.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier() : super(ProductState.initial());

  final ProductState initialState = ProductState.initial();

  void emit(ProductEvent event) {
    event.map(
      product: (productEvent) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Product Api
        final result = await ProductRepository()
            .product(productId: productEvent.productId);

        final ProductState productState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) {
            return initialState.copyWith(isError: true);
          },
          //=-=-=-=- Success -=-=-=-=-=
          (success) {
            return initialState.copyWith(
              // isLoading: true,
              isError: true,
              // product: success['product'],
              // units: success['units'],
              // category: success['category'],
              // seller: success['seller'],
              // similarProducts: success['similar_products'],
            );
          },
        );

        // Notify UI
        state = productState;
      },
    );
  }
}
