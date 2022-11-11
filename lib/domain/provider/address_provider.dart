import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/address/address_notifier.dart';
import 'package:whatsapp_shop/application/address/address_state.dart';

class AddressProvider {
  static final addAddressProvider =
      StateNotifierProvider.autoDispose<AddressNotifier, AddressState>((ref) {
    return AddressNotifier();
  });

  static final selectedTypeProvider =
      StateProvider.autoDispose<String>((ref) => 'Home');
}
