import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/domain/provider/cart/cart_provider.dart';
import 'package:whatsapp_shop/domain/provider/shop/shop_provider.dart';

class RefreshUtils {
  //========== Refresh Carts ==========
  static void refreshCarts(WidgetRef ref) {
    ref.invalidate(CartProvider.cartsProvider);
    ref.invalidate(CartProvider.cartSumProvider);
    ref.invalidate(CartProvider.cartCountProvider);
  }

  //========== Refresh Shop ==========
  static void refreshShop(WidgetRef ref) {
    ref.invalidate(ShopProvider.shopHomeProvider);
    ref.invalidate(ShopProvider.productCategoriesProvider);
  }
}
