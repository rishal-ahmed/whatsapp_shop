import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/images.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.elevation,
    this.backgroundColor = primaryColor,
    this.bottom,
    this.defualt = false,
  }) : super(key: key);
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final bool defualt;
  @override
  Widget build(BuildContext context) {
    return defualt
        ? AppBar(
            backgroundColor: backgroundColor,
            elevation: elevation,
            leading: Builder(
              builder: (context) => IconButton(
                icon: SvgPicture.asset(kIconDrawer,
                    color: const Color(0XFF8D9BA3)),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: defaultTitle,
            centerTitle: true,
            bottom: bottom,
            actions: [
              Center(
                child: IconButton(
                  icon: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(kIconCart),
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Color(0XFF01A783),
                          child: FittedBox(
                            child: Text(
                              '2',
                              style: TextStyle(color: Color(0XFF1F2C34)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              )
            ],
          )
        : AppBar(
            backgroundColor: backgroundColor,
            elevation: elevation,
            leading: leading,
            title: title,
            bottom: bottom,
            actions: actions,
          );
  }

  Widget get defaultTitle => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            kIconLogo,
            height: 26,
            width: 26,
          ),
          // Image.asset(kIconLogo),
          dWidth2,
          Text(
            'WhatsAppShop',
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
        ],
      );

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
