import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class CartTitleChildWidget extends StatelessWidget {
  const CartTitleChildWidget({
    Key? key,
    required this.title,
    required this.child,
    this.shimmer = false,
  }) : super(key: key);

  final String title;
  final Widget child;
  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //========== Title ==========
          ShimmerWidget(
            isLoading: shimmer,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          dHeight1,

          child,
        ],
      ),
    );
  }
}
