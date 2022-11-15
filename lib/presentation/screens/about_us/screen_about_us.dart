import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';

class ScreenAboutUs extends StatelessWidget {
  const ScreenAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'About us'),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: Column(
          children: [
            //==================== About Us Section ====================
            Flexible(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //========== Version ========
                  Text.rich(
                    TextSpan(
                        text: 'About us',
                        style: TextStyle(fontSize: 16.sp),
                        children: [
                          TextSpan(
                            text: '    V 1.0.0',
                            style: TextStyle(
                                color: const Color(0XFF7B7777),
                                fontSize: 15.sp),
                          )
                        ]),
                  ),

                  dHeight2,

                  //========== About Us ==========
                  Text(
                    '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. \n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 14.sp, color: const Color(0XFF707070)),
                  )
                ],
              ),
            ),

            //==================== Terms and Conditions & Privacy Policy Section ====================
            Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: kWhite,
                      horizontalTitleGap: 0,
                      leading: const Icon(
                        Icons.flag_outlined,
                        color: kColorTile,
                      ),
                      title: Text(
                        'Privacy policy',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: kColorTile,
                        ),
                      ),
                      trailing: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                          color: kColorTile,
                        ),
                      ),
                    ),
                    dHeight1,
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: kWhite,
                      horizontalTitleGap: 0,
                      leading: const Icon(
                        Icons.receipt_long_outlined,
                        color: kColorTile,
                      ),
                      title: Text(
                        'Terms and conditions',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: kColorTile,
                        ),
                      ),
                      trailing: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                          color: kColorTile,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
