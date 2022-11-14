import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/address/address_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/address/address_model.dart';
import 'package:whatsapp_shop/domain/provider/address_provider.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';
import 'package:whatsapp_shop/presentation/widgets/errors/errors.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class ScreenAddress extends ConsumerWidget {
  const ScreenAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AddressState state = ref.watch(AddressProvider.getAddressesProvider);

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
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final AddressModel address = state.addresses[index];
                          return Card(
                            child: ListTile(
                              horizontalTitleGap: 0,
                              dense: true,
                              // leading: address.type == "Home"
                              //     ? FittedBox(
                              //         child: Icon(
                              //           Icons.home,
                              //           size: 20.sp,
                              //           color: kBlack,
                              //         ),
                              //       )
                              //     : Icon(
                              //         Icons.work,
                              //         size: 20.sp,
                              //         color: kBlack,
                              //       ),
                              title: Row(
                                children: [
                                  Text(
                                    address.type,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  dWidth05,
                                  address.type == "Home"
                                      ? Icon(
                                          Icons.home_outlined,
                                          size: 16.sp,
                                          color: kBlack,
                                        )
                                      : Icon(
                                          Icons.work_outline,
                                          size: 16.sp,
                                          color: kBlack,
                                        ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  dHeight05,
                                  FractionallySizedBox(
                                    widthFactor: .8,
                                    child: Text(
                                      address.address,
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                  dHeight02,
                                  Text(
                                    'Phone no: ${address.mobile}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  dHeight03,
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                          color: primaryTextColor,
                                          size: 19.sp,
                                        ),
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                      dWidth2,
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete,
                                          color: kRed300,
                                          size: 19.sp,
                                        ),
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return dHeight05;
                        },
                        itemCount: state.addresses.length,
                      ),
                    )
                  else
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
