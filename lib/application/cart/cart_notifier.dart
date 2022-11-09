import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/cart/cart_event.dart';
import 'package:whatsapp_shop/application/cart/cart_state.dart';
import 'package:whatsapp_shop/infrastructure/cart/cart_repository.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState.initial());

  final CartState initialState = CartState.initial();

  void emit(CartEvent event) {
    event.map(
      //=-=-=-=-=-=-=-=-=-=- Add Cart Event -=-=-=-=-=-=-=-=-=-=
      addCart: (addCartEvent) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Add to Cart Api
        final result = await CartRepository().addCart(
          userId: addCartEvent.userId,
          productId: addCartEvent.productId,
          unitId: addCartEvent.unitId,
          quantity: addCartEvent.quantity,
        );

        final CartState cartState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (l) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (r) => initialState.copyWith(status: true),
        );

        // Notify UI
        state = cartState;
      },

      //=-=-=-=-=-=-=-=-=-=- Carts Event -=-=-=-=-=-=-=-=-=-=
      carts: (cartsEvent) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Carts Api
        final result = await CartRepository().carts(userId: cartsEvent.userId);

        final CartState cartState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(carts: success),
        );

        // Notify UI
        state = cartState;
      },

      //=-=-=-=-=-=-=-=-=-=- Cart Count Event -=-=-=-=-=-=-=-=-=-=
      cartCount: (cartCountEvent) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Cart Count Api
        final result =
            await CartRepository().cartCount(userId: cartCountEvent.userId);

        final CartState cartState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(count: success),
        );

        // Notify UI
        state = cartState;
      },
    );
  }
}
