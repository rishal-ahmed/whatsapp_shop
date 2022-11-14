import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/address/address_model.dart';

part 'address_event.freezed.dart';

@freezed
class AddressEvent with _$AddressEvent {
  //=-=-=-=-=- Add Address Event -=-=-=-=-=
  factory AddressEvent.addAddress({required AddressModel addressModel}) =
      _AddressEventAdd;

  //=-=-=-=-=- Address Get Event -=-=-=-=-=
  factory AddressEvent.getAddresses({required int userId}) = _AddressEventGet;

  //=-=-=-=-=- Update Address Event -=-=-=-=-=
  factory AddressEvent.updateAddress({required AddressModel addressModel}) =
      _AddressEventUpdate;

  //=-=-=-=-=- Address Remove Event -=-=-=-=-=
  factory AddressEvent.removeAddress({required int addressId}) =
      _AddressEventRemove;

  //=-=-=-=-=- Address Defualt Event -=-=-=-=-=
  factory AddressEvent.defaultAddress(
      {required int userId, required int addressId}) = _AddressEventDefault;
}
