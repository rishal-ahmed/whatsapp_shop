import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/cart/cart_event.dart';
import 'package:whatsapp_shop/application/cart/cart_notifier.dart';
import 'package:whatsapp_shop/application/cart/cart_state.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';

class CartProvider {
  //==--==--==--==--==-- Cart Add --==--==--==--==--==
  static final addToCartProvider =
      AutoDisposeStateNotifierProvider<CartNotifier, CartState>((ref) {
    return CartNotifier();
  });

  //==--==--==--==--==-- Carts --==--==--==--==--==
  static final cartsProvider = AutoDisposeStateNotifierProviderFamily<
      CartNotifier, CartState, CartEvent>((ref, event) {
    return CartNotifier()..emit(event);
  });

  //==--==--==--==--==-- Cart Sum --==--==--==--==--==
  static final cartSumProvider =
      AutoDisposeStateNotifierProvider<CartNotifier, CartState>((ref) {
    return CartNotifier()
      ..emit(CartEvent.cartSum(userId: UserUtils.instance.userId));
  });

  //==--==--==--==--==-- Cart Count --==--==--==--==--==
  static final cartCountProvider =
      AutoDisposeStateNotifierProvider<CartNotifier, CartState>((ref) {
    return CartNotifier()
      ..emit(CartEvent.cartCount(userId: UserUtils.instance.userModel!.id));
  });

  //==--==--==--==--==-- Cart Clear --==--==--==--==--==
  static final cartClearProvider =
      AutoDisposeStateNotifierProvider<CartNotifier, CartState>((ref) {
    return CartNotifier();
  });

  //==--==--==--==--==-- Cart Remove --==--==--==--==--==
  static final removeCartProvider =
      AutoDisposeStateNotifierProvider<CartNotifier, CartState>(
    (ref) {
      return CartNotifier();
    },
  );
}
