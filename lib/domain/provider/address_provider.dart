import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/address/address_event.dart';
import 'package:whatsapp_shop/application/address/address_notifier.dart';
import 'package:whatsapp_shop/application/address/address_state.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';

class AddressProvider {
  //==--==--==--==--==-- Add Address --==--==--==--==--==
  static final addAddressProvider =
      StateNotifierProvider.autoDispose<AddressNotifier, AddressState>((ref) {
    return AddressNotifier();
  });

  //==--==--==--==--==-- Get Address --==--==--==--==--==
  static final getAddressesProvider =
      StateNotifierProvider.autoDispose<AddressNotifier, AddressState>((ref) {
    return AddressNotifier()
      ..emit(AddressEvent.getAddresses(userId: UserUtils.instance.userId));
  });

  //==--==--==--==--==-- Remove Address --==--==--==--==--==
  static final removeAddressProvider =
      StateNotifierProvider.autoDispose<AddressNotifier, AddressState>((ref) {
    return AddressNotifier();
  });

  //==--==--==--==--==-- Selected Address Cart --==--==--==--==--==
  static final selectedAddressProvider = StateProvider.autoDispose<int?>((ref) {
    return null;
  });

  //==--==--==--==--==-- Selected Type --==--==--==--==--==
  static final selectedTypeProvider =
      StateProvider.autoDispose<String>((ref) => 'Home');
}
