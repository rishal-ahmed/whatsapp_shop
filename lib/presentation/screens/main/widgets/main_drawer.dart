import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xCC585858),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: ScreenSize(context).getSize.height * 0.05,
            ),
            child: Container(
              color: primaryColor,
              height: ScreenSize(context).getSize.height * 0.10,
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenSize(context).getSize.width * 0.05,
                  top: ScreenSize(context).getSize.height * 0.03,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Janvi',
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'janvi123@gmail.com',
                        style: TextStyle(
                            color: buttonTextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.shop_sharp,
              color: buttonTextColor,
              size: 15,
            ),
            title: const Text(
              "Shops",
              style: TextStyle(color: buttonTextColor, fontSize: 11),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_cart,
              color: buttonTextColor,
              size: 15,
            ),
            title: const Text(
              "My Orders",
              style: TextStyle(color: buttonTextColor, fontSize: 11),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.location_on_rounded,
              color: buttonTextColor,
              size: 15,
            ),
            title: const Text(
              "My Address",
              style: TextStyle(color: buttonTextColor, fontSize: 11),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.location_on_rounded,
              color: buttonTextColor,
              size: 15,
            ),
            title: const Text(
              "Select Pincode",
              style: TextStyle(color: buttonTextColor, fontSize: 11),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_sharp,
              color: buttonTextColor,
              size: 15,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(color: buttonTextColor, fontSize: 11),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            thickness: 1,
            color: buttonTextColor,
          ),
          ListTile(
            leading: const Icon(
              Icons.phone,
              color: buttonTextColor,
              size: 15,
            ),
            title: const Text(
              "Contact Us",
              style: TextStyle(color: buttonTextColor, fontSize: 11),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.error,
              color: buttonTextColor,
              size: 15,
            ),
            title: const Text(
              "About Us",
              style: TextStyle(color: buttonTextColor, fontSize: 11),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.file_copy,
              color: buttonTextColor,
              size: 15,
            ),
            title: const Text(
              "Terms & Conditions",
              style: TextStyle(color: buttonTextColor, fontSize: 11),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.file_copy,
              color: buttonTextColor,
              size: 15,
            ),
            title: const Text(
              "Privacy Policy",
              style: TextStyle(color: buttonTextColor, fontSize: 11),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
