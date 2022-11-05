import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';

class ScreenNotification extends StatelessWidget {
  const ScreenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        child: ListView.separated(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kColorFieldBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diwali Offer',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  dHeight05,
                  Text(
                    'Special offers in Diwali sales at stores near you',
                    style: TextStyle(
                      color: const Color(0XFF757575),
                      fontSize: 13.sp,
                    ),
                  ),
                  dHeight03,
                  Text(
                    '2021-10-23 13:20:00',
                    style: TextStyle(
                      color: const Color(0xFF494848),
                      fontSize: 13.sp,
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return dHeight1;
          },
        ),
      ),
    );
  }
}
