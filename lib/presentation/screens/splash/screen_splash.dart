import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_shop/core/constants/images.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    afterSplash(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(kImageSplash),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          kIconLogoWhite,
          width: 20.w,
          height: 20.w,
        ),
      ),
    );
  }

  Future<void> afterSplash(context) async {
    await Future.delayed(const Duration(seconds: 2));

    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.remove('login');

    final String? user = preferences.getString('user');

    if (user != null) {
      UserUtils.instance.saveUserFromString(userString: user);
      Navigator.pushNamedAndRemoveUntil(
          context, routeMain, ModalRoute.withName(routeRoot));
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, routeLogin, ModalRoute.withName(routeRoot));
    }
  }
}
