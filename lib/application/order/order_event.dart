import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_event.freezed.dart';

@freezed
class OrderEvent with _$OrderEvent {
  //=-=-=-=-=- Order Event -=-=-=-=-=
  const factory OrderEvent.order({
    required int userId,
    required int shopId,
    required String paymentType,
    required int addressId,
    @Default(0) num deliveryCharge,
    @Default(0) num discount,
    @Default('') String promoCode,
  }) = _OrderEventOrder;

  //=-=-=-=-=- Orders Event -=-=-=-=-=
  const factory OrderEvent.orders({required int userId}) = _OrderEventOrders;
}
