import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/order/order_model.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required bool isLoading,
    required bool isError,
    required bool status,
    @Default([]) List<OrderModel> orders,
  }) = _OrderState;

  factory OrderState.initital() =>
      const OrderState(isLoading: false, isError: false, status: false);
}
