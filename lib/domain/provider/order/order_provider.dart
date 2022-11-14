import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/order/order_event.dart';
import 'package:whatsapp_shop/application/order/order_notifier.dart';
import 'package:whatsapp_shop/application/order/order_state.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';

class OrderProvider {
  //==--==--==--==--==-- Order --==--==--==--==--==
  static final orderProvider =
      StateNotifierProvider.autoDispose<OrderNotifier, OrderState>((ref) {
    return OrderNotifier();
  });

  //==--==--==--==--==-- Orders --==--==--==--==--==
  static final ordersProvider =
      StateNotifierProvider.autoDispose<OrderNotifier, OrderState>((ref) {
    return OrderNotifier()
      ..emit(OrderEvent.orders(userId: UserUtils.instance.userId));
  });
}
