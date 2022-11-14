import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/base_url.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/images.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/product_category/product_category_model.dart';

class ProductCategoryItemWidget extends StatelessWidget {
  const ProductCategoryItemWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final ProductCategoryModel category;

  @override
  Widget build(BuildContext context) {
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
                backgroundImage: NetworkImage(kImageAppendUrl + category.image),
                onBackgroundImageError: (e, s) => const AssetImage(kImageEre),
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
  }
}
