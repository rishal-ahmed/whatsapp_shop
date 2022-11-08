import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/base_url.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/images.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/product_category/product_category_model.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class ShopProductCategoryList extends StatelessWidget {
  const ShopProductCategoryList({
    Key? key,
    required this.title,
    required this.productCategories,
    required this.shimmer,
  }) : super(key: key);

  final String title;
  final List<ProductCategoryModel> productCategories;
  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    return !shimmer
        ? Container(
            color: kWhite,
            height: 18.h,
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
                dHeight1,
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final ProductCategoryModel category =
                          productCategories[index];
                      return SizedBox(
                        width: 15.w,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      kImageAppendUrl + category.image),
                                  onBackgroundImageError: (e, s) =>
                                      const AssetImage(kImageEre),
                                ),
                                dHeight05,
                                Text(
                                  '${category.name}\n',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    overflow: TextOverflow.ellipsis,
                                    color: primaryTextColor,
                                  ),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return dWidth5;
                    },
                    itemCount: productCategories.length,
                  ),
                ),
              ],
            ),
          )
        :
        //==================== Shimmer ====================
        Container(
            color: kWhite,
            height: 18.h,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget(
                      child: Text(
                        title,
                        style:
                            TextStyle(color: primaryTextColor, fontSize: 14.sp),
                      ),
                    ),
                    ShimmerWidget(
                      child: Text(
                        'View all',
                        style: TextStyle(
                            color: secondaryTextColor, fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),
                dHeight1,
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 15.w,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const ShimmerWidget(
                                  child: CircleAvatar(
                                    radius: 30,
                                  ),
                                ),
                                dHeight05,
                                ShimmerWidget(
                                  child: Text(
                                    'Category Name\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      overflow: TextOverflow.ellipsis,
                                      color: primaryTextColor,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return dWidth5;
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          );
  }
}
