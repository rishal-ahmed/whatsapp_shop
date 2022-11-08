import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';
import 'package:whatsapp_shop/presentation/widgets/buttons/custom_material_button.dart';
import 'package:whatsapp_shop/presentation/widgets/dropdown/custom_dropdown_widget.dart';

class ScreenProduct extends ConsumerWidget {
  const ScreenProduct({required this.productId, super.key});
  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarWidget(defualt: true),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //==================== Product Title & Image Field ====================
              Container(
                color: kWhite,
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                child: Column(
                  children: [
                    //========== Product Title ==========
                    Text(
                      'Zero Gravity Portable Textilene Fabric and Steel Reclining Lounge Chiaair, Blue',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: primaryTextColor,
                      ),
                    ),
                    dHeight2,
                    //========== Product Image Slider ==========
                    Consumer(
                      builder: (context, ref, _) {
                        return Stack(
                          children: [
                            ImageSlideshow(
                              autoPlayInterval: 3000,
                              isLoop: true,
                              children: [
                                Image.network(
                                  'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                  fit: BoxFit.cover,
                                ),
                                Image.network(
                                  'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                  fit: BoxFit.cover,
                                ),
                                Image.network(
                                  'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            //========== Offer Circle ==========
                            const Positioned(
                              right: 5,
                              top: 5,
                              child: CircleAvatar(
                                backgroundColor: primaryTextColor,
                                radius: 15,
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: FittedBox(
                                    child: Text(
                                      '30%\nOff',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              kHeight1,

              //==================== Cart & Buy Field ====================
              Container(
                color: kWhite,
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //========== Prices Field ==========
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MRP : ',
                              style: TextStyle(
                                  color: primaryTextColor, fontSize: 15.sp),
                            ),
                            Text.rich(
                              TextSpan(
                                text: '₹5300\n',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text: '₹3600',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      decoration: TextDecoration.none,
                                      color: const Color(0XFFFF0404),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //========== Quantity Field ==========
                        Column(
                          children: [
                            Text(
                              'In Stock.',
                              style: TextStyle(
                                  color: secondaryTextColor, fontSize: 14.sp),
                            ),
                            dHeight05,
                            CustomDropDownWidget(
                              width: 15.w,
                              preText: 'Qty:  ',
                              value: '1',
                              items: const [
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                              ],
                              onChanged: (value) {
                                log('qty = $value');
                              },
                            )
                          ],
                        )
                      ],
                    ),

                    dHeight1,
                    CustomMaterialBtton(
                      onPressed: () {},
                      buttonText: 'Add to Cart',
                      color: secondaryColor,
                      borderColor: secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    dHeight05,
                    CustomMaterialBtton(
                      onPressed: () {},
                      buttonText: 'Buy Now',
                      color: primaryColor,
                      borderColor: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    dHeight2,
                    Text(
                      'Quick Review',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: primaryTextColor,
                      ),
                    ),
                    kHeight2,
                    Text(
                      'Awesome product for home and business uses..',
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kColorDim,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              kHeight1,
            ],
          ),
        ),
      ),
    );
  }
}
