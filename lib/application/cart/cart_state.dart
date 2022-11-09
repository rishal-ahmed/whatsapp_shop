import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/cart/cart_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required bool isLoading,
    required bool isError,
    @Default(null) CartModel? cart,
    required bool status,
  }) = _CartState;

  factory CartState.initial() =>
      const CartState(isLoading: false, isError: false, status: false);
}
