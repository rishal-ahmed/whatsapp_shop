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
  }) = _CartEvent;

  //=-=-=-=-=- Carts Event -=-=-=-=-=
  factory CartEvent.carts({required int userId}) = _CartEventCart;

  //=-=-=-=-=- Cart Count Event -=-=-=-=-=
  factory CartEvent.cartCount({required int userId}) = _CartEventCount;
}
