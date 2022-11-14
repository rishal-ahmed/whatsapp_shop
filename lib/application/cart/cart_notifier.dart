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
      addCart: (eventAdd) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Add to Cart Api
        final result = await CartRepository().addCart(
          userId: eventAdd.userId,
          productId: eventAdd.productId,
          unitId: eventAdd.unitId,
          quantity: eventAdd.quantity,
        );

        final CartState cartState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (l) => initialState.copyWith(
            isError: true,
            errorMessage: l.error,
          ),
          //=-=-=-=- Success -=-=-=-=-=
          (r) => initialState.copyWith(status: true),
        );

        // Notify UI
        state = cartState;
      },

      //=-=-=-=-=-=-=-=-=-=- Carts Event -=-=-=-=-=-=-=-=-=-=
      carts: (eventCarts) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Carts Api
        final result = await CartRepository().carts(userId: eventCarts.userId);

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
      cartCount: (eventCount) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Cart Count Api
        final result =
            await CartRepository().cartCount(userId: eventCount.userId);

        final CartState cartState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(count: success),
        );

        // Notify UI
        state = cartState;
      },

      //=-=-=-=-=-=-=-=-=-=- Cart Sum Event -=-=-=-=-=-=-=-=-=-=
      cartSum: (eventSum) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Cart Sum Api
        final result = await CartRepository().cartSum(userId: eventSum.userId);

        final CartState cartState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(sum: success),
        );

        // Notify UI
        state = cartState;
      },

      //=-=-=-=-=-=-=-=-=-=- Cart Remove Event -=-=-=-=-=-=-=-=-=-=
      cartRemove: (eventRemove) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Cart Remove Api
        final result =
            await CartRepository().cartRemove(cartId: eventRemove.cartId);

        final CartState cartState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(status: success),
        );

        // Notify UI
        state = cartState;
      },

      //=-=-=-=-=-=-=-=-=-=- Cart Remove Event -=-=-=-=-=-=-=-=-=-=
      cartClear: (eventClear) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Cart Clear Api
        final result =
            await CartRepository().cartClear(userId: eventClear.userId);

        final CartState cartState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(status: success),
        );

        // Notify UI
        state = cartState;
      },

      //=-=-=-=-=-=-=-=-=-=- Cart Change Quantity Event -=-=-=-=-=-=-=-=-=-=
      cartChangeQuanity: (eventQuantity) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Cart Change Quantity Api
        final result = await CartRepository().cartChangeQuantity(
          cartId: eventQuantity.cartId,
          quantity: eventQuantity.quantity,
        );

        final CartState cartState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(status: success),
        );

        // Notify UI
        state = cartState;
      },
    );
  }
}
