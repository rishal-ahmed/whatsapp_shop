import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/address/address_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/address/address_model.dart';
import 'package:whatsapp_shop/domain/provider/address/address_provider.dart';
import 'package:whatsapp_shop/presentation/screens/address/widgets/address_item_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';
import 'package:whatsapp_shop/presentation/widgets/errors/error.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class ScreenAddress extends ConsumerWidget {
  const ScreenAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AddressState state = ref.watch(AddressProvider.getAddressesProvider);
    final addressesProvider =
        StateProvider.autoDispose<List<AddressModel>>((ref) {
      return state.addresses;
    });

    return Scaffold(
      appBar: const AppBarWidget(title: 'Addresses'),
      backgroundColor: state.isLoading ? kWhite : kBackgroundColor,
      body: state.isError
          ? const SomethingWentWrongWidget()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget(
                    isLoading: state.isLoading,
                    child: Text(
                      'Saved Addresses',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  dHeight1,
                  if (!state.isLoading)
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, _) {
                          final List<AddressModel> addresses =
                              ref.watch(addressesProvider);

                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final AddressModel address = addresses[index];
                              //==================== Address Item Widget ====================
                              return AddressItemWidget(
                                address: address,
                                addressesProvider: addressesProvider,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return dHeight05;
                            },
                            itemCount: addresses.length,
                          );
                        },
                      ),
                    )
                  else
                    //==================== Shimmer Widget ====================
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ShimmerWidget(
                            height: 10.h,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return dHeight1;
                        },
                        itemCount: 18,
                      ),
                    )
                ],
              ),
            ),
    );
  }
}
