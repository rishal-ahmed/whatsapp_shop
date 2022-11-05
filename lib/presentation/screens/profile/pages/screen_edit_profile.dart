import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';

class ScreenEditProfile extends StatelessWidget {
  const ScreenEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryColor,
              ),
            ),
            dHeight1,
            const Text('Personal Information')
          ],
        ),
      ),
    );
  }
}
