import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/address/address_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/address/address_model.dart';
import 'package:whatsapp_shop/domain/provider/address_provider.dart';
import 'package:whatsapp_shop/presentation/screens/cart/widgets/cart_title_child_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class CartDeliveryAddressField extends ConsumerWidget {
  const CartDeliveryAddressField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AddressState state = ref.watch(AddressProvider.getAddressesProvider);

    return CartTitleChildWidget(
      title: 'Delivery Address',
      shimmer: state.isLoading,
      child: !state.isLoading
          ? Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final AddressModel address = state.addresses[index];
                    if (address.defaultAddress == "1") {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(AddressProvider
                                .selectedAddressProvider.notifier)
                            .state = address.id;
                      });
                    }
                    return Consumer(
                      builder: (context, ref, _) {
                        final int? selctedAddress =
                            ref.watch(AddressProvider.selectedAddressProvider);
                        return RadioListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: address.id,
                          groupValue: selctedAddress,
                          dense: true,
                          onChanged: (value) {
                            ref
                                .read(AddressProvider
                                    .selectedAddressProvider.notifier)
                                .state = address.id;
                          },
                          title: Row(
                            children: [
                              Text(
                                address.name,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              dWidth1,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0XFF039300),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 3,
                                ),
                                child: FittedBox(
                                  child: Text(
                                    address.type,
                                    style: TextStyle(
                                        fontSize: 11.sp, color: kWhite),
                                  ),
                                ),
                              )
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              dHeight03,
                              Text(
                                address.mobile,
                                style: TextStyle(fontSize: 13.sp),
                              ),
                              dHeight01,
                              FractionallySizedBox(
                                widthFactor: .8,
                                child: Text(
                                  address.address,
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 13.sp),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  itemCount: state.addresses.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return dHeight05;
                  },
                ),

                dHeight1,
                //==================== Add new Address ====================
                ListTile(
                  dense: true,
                  leading: Text(
                    'Add new Address',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: kBlack,
                      size: 20.sp,
                    ),
                    onPressed: () async {
                      final status =
                          await Navigator.pushNamed(context, routeAddAddress);
                      if (status == true) {
                        ref.invalidate(AddressProvider.getAddressesProvider);
                      }
                    },
                  ),
                ),
              ],
            )
          : ShimmerWidget(
              child: Column(
                children: [
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: false,
                    groupValue: false,
                    dense: true,
                    onChanged: (value) {},
                    title: Row(
                      children: [
                        Flexible(
                          child: FractionallySizedBox(
                            widthFactor: .6,
                            child: Container(
                              color: kWhite,
                              height: 10.sp,
                            ),
                          ),
                        ),
                        dWidth1,
                        Flexible(
                          child: FractionallySizedBox(
                            widthFactor: .20,
                            child: Container(
                              color: kWhite,
                              height: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        dHeight05,
                        Container(
                          color: kWhite,
                          height: 9.sp,
                          width: 20.w,
                        ),
                        dHeight03,
                        Container(
                          color: kWhite,
                          height: 9.sp,
                          width: 50.w,
                        ),
                        dHeight02,
                        Container(
                          color: kWhite,
                          height: 9.sp,
                          width: 17.w,
                        ),
                      ],
                    ),
                  ),
                  dHeight05,

                  //==================== Add new Address ====================
                  ListTile(
                    dense: true,
                    leading: Text(
                      'Add new Address',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: kBlack,
                        size: 20.sp,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
