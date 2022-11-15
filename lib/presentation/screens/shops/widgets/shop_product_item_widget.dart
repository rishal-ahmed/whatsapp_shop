import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/product/product_model.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class ShopProductItemWidget extends StatelessWidget {
  const ShopProductItemWidget({
    Key? key,
    this.discount,
    this.product,
    this.shimmer = false,
  }) : super(key: key);

  final String? discount;
  final ProductModel? product;

  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    return !shimmer
        ? InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                routeProduct,
                arguments: product!.id,
              );
            },
            child: SizedBox(
              width: 32.w,
              child: Column(
                children: [
                  Flexible(
                    child: Stack(
                      children: [
                        Container(
                          width: 32.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffE5E5E5)),
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
                    '${product!.name}\n',
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
                      text: '₹${product!.unit!.offerPrice}  ',
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: '₹${product!.unit!.price}',
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
            ),
          )
        : ShimmerWidget(
            child: SizedBox(
              width: 32.w,
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      width: 32.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffE5E5E5)),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10)),
                        color: kWhite,
                      ),
                    ),
                  ),
                  dHeight05,
                  FractionallySizedBox(
                    widthFactor: .3,
                    child: Container(
                      color: kWhite,
                      height: 10.sp,
                    ),
                  ),
                  SizedBox(height: 14.sp),
                  FractionallySizedBox(
                    widthFactor: .5,
                    child: Container(
                      color: kWhite,
                      height: 10.sp,
                    ),
                  ),
                  dHeight03,
                  SizedBox(height: 15.sp),
                ],
              ),
            ),
          );
  }
}
