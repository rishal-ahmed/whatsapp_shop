import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/images.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';

const List<IconData> _icons = [
  Icons.call_outlined,
  Icons.mail_outlined,
  Icons.language_outlined,
  Icons.near_me_outlined,
];

const List<String> _titles = [
  'Touch with us',
  'Mail us',
  'Explore website',
  'Reach us',
];

class ScreenSupport extends StatelessWidget {
  const ScreenSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Support'),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              dHeight5,
              const SizedBox(width: double.infinity),
              SvgPicture.asset(
                kImageSupport,
                fit: BoxFit.cover,
                width: 15.w,
              ),
              dHeight1,
              Text(
                'How can we help \nyou ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0XFF2BAD40),
                ),
              ),
              dHeight5,
              ...List<Widget>.generate(
                4,
                (index) {
                  final String title = _titles[index];
                  final IconData icon = _icons[index];
                  return Column(
                    children: [
                      ListTile(
                        // dense: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tileColor: kWhite,
                        horizontalTitleGap: 0,
                        leading: Icon(
                          icon,
                          color: kColorTile,
                        ),
                        title: Text(
                          title,
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
                      dHeight1n5,
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
