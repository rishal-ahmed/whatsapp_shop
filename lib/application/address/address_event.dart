import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/address/address_model.dart';

part 'address_event.freezed.dart';

@freezed
class AddressEvent with _$AddressEvent {
  //=-=-=-=-=- Add Address Event -=-=-=-=-=
  factory AddressEvent.addAddress({
    required AddressModel addressModel,
  }) = _AddressEventAdd;

  //=-=-=-=-=- Address Count Event -=-=-=-=-=
  factory AddressEvent.getAddresses({required int userId}) = _AddressEventGet;
}
