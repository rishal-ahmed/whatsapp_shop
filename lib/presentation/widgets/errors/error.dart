import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/images.dart';

class SomethingWentWrongWidget extends StatelessWidget {
  const SomethingWentWrongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            kImageError,
            width: 80.w,
            alignment: Alignment.center,
          ),
          FittedBox(
            child: Text(
              'Something went wrong!',
              style: TextStyle(
                color: primaryTextColor,
                fontSize: 15.sp,
              ),
            ),
          ),
          const SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
