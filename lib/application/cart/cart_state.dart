import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/cart/cart_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required bool isLoading,
    required bool isError,
    required bool status,
    @Default('') String errorMessage,
    @Default([]) List<CartModel> carts,
    @Default(null) int? count,
    @Default(null) num? sum,
  }) = _CartState;

  factory CartState.initial() =>
      const CartState(isLoading: false, isError: false, status: false);
}
