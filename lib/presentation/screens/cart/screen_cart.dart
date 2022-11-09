import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/screens/cart/widgets/cart_item_widget.dart';
import 'package:whatsapp_shop/presentation/screens/cart/widgets/cart_title_child_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';
import 'package:whatsapp_shop/presentation/widgets/buttons/custom_material_button.dart';

class ScreenCart extends ConsumerWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarWidget(
          defualt: true, centerTitle: false, title: 'Cart', cartTap: false),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //==================== Cart Items Field ====================
            Container(
              color: kWhite,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  log('index == $index');
                  return const CartItemWidget();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return dHeight1;
                },
              ),
            ),

            kHeight05,

            //==================== Bill Details Field ====================
            CartTitleChildWidget(
              title: 'Bill Details',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    dense: true,
                    leading: Text(
                      'Item Total',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    trailing: Text(
                      '₹320',
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text(
                      'Delivery charges',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    trailing: Text(
                      '₹30',
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text(
                      'Total Amount',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    trailing: Text(
                      '₹350',
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kHeight05,
            //==================== Payment Options Field ====================
            CartTitleChildWidget(
              title: 'Payment Options',
              child: Column(
                children: [
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: true,
                    groupValue: true,
                    dense: true,
                    onChanged: (value) {},
                    title: Text(
                      'Would you like to pay online',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: true,
                    groupValue: false,
                    dense: true,
                    onChanged: (value) {},
                    title: Text(
                      'Would you like to pay cash on delivery',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ),
            kHeight05,

            //==================== Delivery Address Field ====================
            CartTitleChildWidget(
              title: 'Delivery Address',
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
                        Text(
                          'Rishal Ahmed',
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
                              'Home',
                              style: TextStyle(fontSize: 11.sp, color: kWhite),
                            ),
                          ),
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6282712271',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        Text(
                          'ERE business solutions, cyberpark, kozhikode, kerala,673636',
                          style: TextStyle(fontSize: 13.sp),
                        )
                      ],
                    ),
                  ),
                  dHeight05,
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: true,
                    groupValue: false,
                    dense: true,
                    onChanged: (value) {},
                    title: Row(
                      children: [
                        Text(
                          'Rishal Ahmed',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        dWidth1,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            // color: kGreen,
                            color: const Color(0XFF039300),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          child: FittedBox(
                            child: Text(
                              'Office',
                              style: TextStyle(fontSize: 11.sp, color: kWhite),
                            ),
                          ),
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6282712271',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        Text(
                          'ERE business solutions, cyberpark, kozhikode, kerala,673636',
                          style: TextStyle(fontSize: 13.sp),
                        )
                      ],
                    ),
                  ),
                  dHeight1,
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

            kHeight05,

            //==================== Buy Button ====================
            Container(
              color: kWhite,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: CustomMaterialBtton(
                  onPressed: () {},
                  buttonText: 'Buy Now',
                  color: primaryColor,
                  borderColor: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
