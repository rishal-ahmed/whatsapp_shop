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
      getAddresses: (eventAdresses) {},
    );
  }
}
