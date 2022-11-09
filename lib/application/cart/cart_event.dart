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

  //=-=-=-=-=- Cart Count Event -=-=-=-=-=

}
