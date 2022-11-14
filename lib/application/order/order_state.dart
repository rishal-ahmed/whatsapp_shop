import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required bool isLoading,
    required bool isError,
    required bool status,
  }) = _OrderState;

  factory OrderState.initital() =>
      const OrderState(isLoading: false, isError: false, status: false);
}
