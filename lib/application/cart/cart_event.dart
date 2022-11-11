import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  //=-=-=-=-=- Add Cart Event -=-=-=-=-=
  factory CartEvent.addCart({
    required int userId,
    required int productId,
    required int unitId,
    required int quantity,
  }) = _CartEventAdd;

  //=-=-=-=-=- Carts Event -=-=-=-=-=
  factory CartEvent.carts({required int userId}) = _CartEventCarts;

  //=-=-=-=-=- Cart Count Event -=-=-=-=-=
  factory CartEvent.cartCount({required int userId}) = _CartEventCount;

  //=-=-=-=-=- Cart Sum Event -=-=-=-=-=
  factory CartEvent.cartSum({required int userId}) = _CartEventSum;

  //=-=-=-=-=- Cart Remove Event -=-=-=-=-=
  factory CartEvent.cartRemove({required int cartId}) = _CartEventRemove;

  //=-=-=-=-=- Cart Clear Event -=-=-=-=-=
  factory CartEvent.cartClear({required int userId}) = _CartEventClear;

  //=-=-=-=-=- Cart Change Quantity Event -=-=-=-=-=
  factory CartEvent.cartChangeQuanity(
      {required int cartId, required int quantity}) = _CartEventChangeQuantity;
}
