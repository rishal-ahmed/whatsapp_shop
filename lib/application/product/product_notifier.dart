import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/product/product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier() : super(ProductState.initial());

  final ProductState initialState = ProductState.initial();
}
