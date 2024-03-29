import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/user/user_model.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';

const List<String> _titles = [
  'Shops',
  'My Orders',
  'My Address',
  'Select Pincode',
  'Log Out',
  'Contact Us',
  'About Us',
  'Terms & Conditions',
  'Privacy Policy',
];

const List<IconData> _icons = [
  Icons.store,
  Icons.shopping_cart,
  Icons.location_on,
  Icons.pin_drop,
  Icons.logout,
  Icons.call,
  Icons.info,
  Icons.receipt_long,
  Icons.receipt_long,
];

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserUtils.instance.userModel!;
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xCC585858),
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          Container(
            color: primaryColor,
            height: 13.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                ),
                kHeight2,
                Text(
                  user.email,
                  style: TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          dHeight1,
          ...List.generate(
            _titles.length + 1,
            (index) {
              if (index == 5) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: const Divider(
                    color: kWhite,
                    thickness: 1.5,
                  ),
                );
              } else {
                final String title =
                    index > 5 ? _titles[index - 1] : _titles[index];
                final IconData icon =
                    index > 5 ? _icons[index - 1] : _icons[index];
                return ListTile(
                  onTap: () => onTap(context, index),
                  horizontalTitleGap: 0,
                  leading: Icon(icon, color: kWhite),
                  title: Text(
                    title,
                    style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                );
              }
            },
          )
        ]),
      ),
    );
  }

  void onTap(BuildContext context, int index) async {
    if (index != 4) Navigator.pop(context);
    switch (index) {
      case 1:
        Navigator.pushNamed(context, routeOrder);
        break;
      case 2:
        Navigator.pushNamed(context, routeAddress);
        break;
      case 4:
        await UserUtils.instance.logoutUser(context);
        break;
      case 7:
        Navigator.pushNamed(context, routeAboutUs);
        break;
      default:
    }
  }
}
