import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/product/product_model.dart';
import 'package:whatsapp_shop/domain/utils/converter/converter.dart';

class ShopProductList extends StatelessWidget {
  const ShopProductList({
    Key? key,
    required this.title,
    required this.products,
  }) : super(key: key);

  final String title;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      height: 24.h,
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: primaryTextColor, fontSize: 14.sp),
              ),
              Text(
                'View all',
                style: TextStyle(color: secondaryTextColor, fontSize: 13.sp),
              ),
            ],
          ),
          dHeight2,
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final ProductModel product = products[index];
                final String discount = ConverterUtils.numRounderToString(100 *
                    (product.unit.price - product.unit.offerPrice) /
                    product.unit.price);
                log('discount = $discount');
                return SizedBox(
                  width: 32.w,
                  child: Column(
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            Container(
                              width: 32.w,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffE5E5E5)),
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1542219550-37153d387c27?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: CircleAvatar(
                                backgroundColor: primaryTextColor,
                                radius: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: FittedBox(
                                    child: Text(
                                      '$discount%\nOff',
                                      // '30%\nOff',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      dHeight05,
                      Text(
                        '${product.name}\n',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xff333333),
                          fontSize: 13.sp,
                        ),
                        maxLines: 2,
                      ),
                      dHeight03,
                      Text.rich(
                        TextSpan(
                          text: '₹${product.unit.offerPrice}  ',
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: '₹${product.unit.price}',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontSize: 12.sp,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return dWidth3;
              },
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
