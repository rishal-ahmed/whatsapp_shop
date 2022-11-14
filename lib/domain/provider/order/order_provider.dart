import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/order/order_notifier.dart';
import 'package:whatsapp_shop/application/order/order_state.dart';

class OrderProvider {
  //==--==--==--==--==-- Order --==--==--==--==--==
  static final orderProvider =
      StateNotifierProvider.autoDispose<OrderNotifier, OrderState>((ref) {
    return OrderNotifier();
  });
}
