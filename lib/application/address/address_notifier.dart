import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:whatsapp_shop/application/address/address_event.dart';
import 'package:whatsapp_shop/application/address/address_state.dart';
import 'package:whatsapp_shop/infrastructure/address/address_repository.dart';

class AddressNotifier extends StateNotifier<AddressState> {
  AddressNotifier() : super(AddressState.initial());

  final AddressState initialState = AddressState.initial();

  void emit(AddressEvent event) {
    event.map(
      //=-=-=-=-=-=-=-=-=-=- Add Address Event -=-=-=-=-=-=-=-=-=-=
      addAddress: (eventAdd) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Add Address Api
        final result = await AddressRepository()
            .addAddress(addressModel: eventAdd.addressModel);

        final AddressState addressState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (l) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (r) => initialState.copyWith(status: true),
        );

        // Notify UI
        state = addressState;
      },
      //=-=-=-=-=-=-=-=-=-=- Get Addresses Event -=-=-=-=-=-=-=-=-=-=
      getAddresses: (eventAdresses) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Get Addresses Api
        final result = await AddressRepository()
            .getAddresses(userId: eventAdresses.userId);

        final AddressState addressState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(addresses: success),
        );

        // Notify UI
        state = addressState;
      },

      //=-=-=-=-=-=-=-=-=-=- Update Address Event -=-=-=-=-=-=-=-=-=-=
      updateAddress: (eventUpdate) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Update Address Api
        final result = await AddressRepository()
            .updateAddress(addressModel: eventUpdate.addressModel);

        final AddressState addressState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (l) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (r) => initialState.copyWith(status: true),
        );

        // Notify UI
        state = addressState;
      },

      //=-=-=-=-=-=-=-=-=-=- Remove Address Event -=-=-=-=-=-=-=-=-=-=
      removeAddress: (eventRemove) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Remove Address Api
        final result = await AddressRepository()
            .removeAddress(addressId: eventRemove.addressId);

        final AddressState addressState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(status: true),
        );

        // Notify UI
        state = addressState;
      },

      //=-=-=-=-=-=-=-=-=-=- Default Address Event -=-=-=-=-=-=-=-=-=-=
      defaultAddress: (eventdefault) async {
        // Loading
        state = initialState.copyWith(isLoading: true);

        // Default Address Api
        final result = await AddressRepository().defaultAddress(
            userId: eventdefault.userId, addressId: eventdefault.addressId);

        final AddressState addressState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) => initialState.copyWith(isError: true),
          //=-=-=-=- Success -=-=-=-=-=
          (success) => initialState.copyWith(status: true),
        );

        // Notify UI
        state = addressState;
      },
    );
  }
}
