import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/order/order_event.dart';
import 'package:whatsapp_shop/application/order/order_state.dart';
import 'package:whatsapp_shop/infrastructure/order/order_repository.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier() : super(OrderState.initital());

  final OrderState initialState = OrderState.initital();

  void emit(OrderEvent event) {
    event.map(
      //=-=-=-=-=-=-=-=-=-=- Order Event -=-=-=-=-=-=-=-=-=-=
      order: (eventOrder) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Order Api
        final result = await OrderRepository().order(
          userId: eventOrder.userId,
          shopId: eventOrder.shopId,
          addressId: eventOrder.addressId,
          paymentType: eventOrder.paymentType,
          promoCode: eventOrder.promoCode,
          discount: eventOrder.discount,
          deliveryCharge: eventOrder.deliveryCharge,
        );

        final OrderState orderState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (l) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (r) => initialState.copyWith(status: true),
        );

        // Notify UI
        state = orderState;
      },
      //=-=-=-=-=-=-=-=-=-=- Orders Event -=-=-=-=-=-=-=-=-=-=
      orders: (eventOrders) {},
    );
  }
}
