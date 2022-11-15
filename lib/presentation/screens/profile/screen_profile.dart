import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/user/user_model.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserUtils.instance.userModel!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dHeight2,
              //==================== Profile Field ====================
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 38,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                  ),
                  dWidth5,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dHeight1,
                      Text.rich(
                        TextSpan(
                          text: 'Hi\n',
                          style: TextStyle(fontSize: 14.sp),
                          children: [
                            TextSpan(
                              text: user.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      dHeight03,
                      Text(
                        user.email,
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      dHeight02,
                      Text(
                        user.phone,
                        style: TextStyle(fontSize: 13.sp),
                      )
                    ],
                  )
                ],
              ),
              dHeight5,

              //==================== Options Field ====================
              Text(
                'Your Informations',
                style: TextStyle(
                  color: const Color(0XFF595959),
                  fontSize: 14.sp,
                ),
              ),
              dHeight1,

              ...List.generate(
                _titles.length + 1,
                (index) {
                  if (index == 4) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Text(
                        'Others',
                        style: TextStyle(
                          color: const Color(0XFF595959),
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  } else {
                    final String title =
                        index > 4 ? _titles[index - 1] : _titles[index];
                    final IconData icon =
                        index > 4 ? _icons[index - 1] : _icons[index];
                    return ListTile(
                      dense: true,
                      onTap: () async => await onTap(context, index),
                      horizontalTitleGap: 0,
                      leading: Icon(icon, color: const Color(0XFF656565)),
                      title: Text(
                        title,
                        style: TextStyle(
                          color: primaryTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  //==================== OnTap Function ====================
  Future<void> onTap(BuildContext context, int index) async {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, routeOrder);
        break;
      case 1:
        Navigator.pushNamed(context, routeAddress);
        break;
      case 2:
        Navigator.pushNamed(context, routeEditProfile);
        break;
      case 5:
        Navigator.pushNamed(context, routeSupport);
        break;
      case 7:
        Navigator.pushNamed(context, routeAboutUs);
        break;
      case 9:
        await UserUtils.instance.logoutUser(context);
        break;
      default:
    }
  }
}

const List<String> _titles = [
  'Order History',
  'Address Book',
  'Edit Profile',
  'Notification',
  'Support',
  'Share',
  'About Us',
  'Change Password',
  'Logout',
];

const List<IconData> _icons = [
  Icons.feed_outlined,
  Icons.contact_mail_outlined,
  Icons.edit_outlined,
  Icons.notifications_outlined,
  Icons.support_agent_outlined,
  Icons.near_me_outlined,
  Icons.info_outlined,
  Icons.lock_open_outlined,
  Icons.logout_outlined,
];
