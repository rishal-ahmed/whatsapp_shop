import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/product/product_model.dart';
import 'package:whatsapp_shop/domain/utils/converter/converter.dart';
import 'package:whatsapp_shop/presentation/screens/shops/widgets/shop_product_item_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class ShopProductList extends ConsumerWidget {
  const ShopProductList({
    Key? key,
    required this.title,
    required this.products,
    this.shimmer = false,
    this.refresh = false,
    this.productId,
  }) : super(key: key);

  final String title;
  final List<ProductModel> products;
  final bool shimmer;
  final bool refresh;
  final int? productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return !shimmer
        ? Container(
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
                      style:
                          TextStyle(color: primaryTextColor, fontSize: 14.sp),
                    ),
                    Text(
                      'View all',
                      style:
                          TextStyle(color: secondaryTextColor, fontSize: 13.sp),
                    ),
                  ],
                ),
                dHeight2,
                //========== Product List ==========
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final ProductModel product = products[index];
                      final String discount = ConverterUtils.numRounderToString(
                          100 *
                              (product.unit!.price - product.unit!.offerPrice) /
                              product.unit!.price);

                      //========== Shop Product Item ==========
                      return ShopProductItemWidget(
                        discount: discount,
                        product: product,
                        onTap: () {
                          if (refresh) {
                            Navigator.pushReplacementNamed(
                                context, routeProduct,
                                arguments: product.id);
                          } else {
                            // Navigate to Product Page

                            Navigator.pushNamed(context, routeProduct,
                                arguments: product.id);
                          }
                        },
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
          )
        : Container(
            color: kWhite,
            height: 24.h,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Category',
                        style:
                            TextStyle(color: primaryTextColor, fontSize: 14.sp),
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                            color: secondaryTextColor, fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
                dHeight2,
                //========== Product List ==========
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      //========== Shop Product Item ==========
                      return const ShopProductItemWidget(
                        shimmer: true,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return dWidth3;
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          );
  }
}
