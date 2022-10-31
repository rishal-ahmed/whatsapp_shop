import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/presentation/screens/shops/screen_shops1.dart';
import '../../../core/constants/sizes.dart';
import '../../widgets/text_fields/text_field_widget.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  TextEditingController search = TextEditingController();
  String dropdownvalue = 'All Shops';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
                              color: secondaryTextColor,
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
      ),
      appBar: AppBar(
        shadowColor: buttonTextColor,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.whatsapp,
              color: secondaryTextColor,
              size: 24,
            ),
            kWidth10,
            Text(
              'WhatsAppShop',
              style: TextStyle(
                color: appbarTextColor,
                fontSize: 12,
              ),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize(context).getSize.height * 0.02,
                right: ScreenSize(context).getSize.height * 0.02,
                top: ScreenSize(context).getSize.height * 0.01,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: ScreenSize(context).getSize.height * 0.04,
                      width: ScreenSize(context).getSize.width * 0.010,
                      decoration: BoxDecoration(
                        border: Border.all(color: kColorHint),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        isDense: true,
                        value: dropdownvalue,
                        iconSize: 15,
                        iconEnabledColor: textColor,
                        onChanged: (newValue) {},
                        items: <String>[
                          'All Shops',
                          'ABC Shops',
                          'DD House',
                          'AX Hotel',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            alignment: Alignment.centerLeft,
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 9, color: primaryColor),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize(context).getSize.height * 0.04,
                    width: ScreenSize(context).getSize.width * 0.75,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: ScreenSize(context).getSize.height * 0.02,
                      ),
                      child: TextFeildWidget(
                        textInputType: TextInputType.visiblePassword,
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 10, 15, 18),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                              color: authTextColor,
                            )),
                        controller: search,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: searchBorderColor,
                            ),
                            child: const Icon(
                              Icons.search,
                              color: textColor,
                            ),
                          ),
                        ),
                        hintText: 'Search Products, Category and More',
                        hintStyle: const TextStyle(
                          color: kColorHint,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kHeight10,
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenShop1()));
              },
              child: SizedBox(
                  height: ScreenSize(context).getSize.height * 0.23,
                  width: double.infinity,
                  child: const Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                  )),
            ),
            kHeight5,
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize(context).getSize.width * 0.05,
              ),
              child: SizedBox(
                height: ScreenSize(context).getSize.height * 0.17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      " Newest Shops",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    kHeight5,
                    Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: ScreenSize(context).getSize.width *
                                        0.05,
                                  ),
                                  child: Container(
                                    height: ScreenSize(context).getSize.height *
                                        0.09,
                                    width: ScreenSize(context).getSize.width *
                                        0.18,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kColorHint),
                                        color: buttonTextColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6))),
                                  ),
                                ),
                                kHeight5,
                                const Text(
                                  'Tiga Vision',
                                  style: TextStyle(
                                    color: gridTextColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                kHeight5,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Center(
                                      child: Text(
                                        '4.2 ',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 6,
                                    )
                                  ],
                                ),
                                kWidth5,
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: ScreenSize(context).getSize.height * 0.25,
                width: double.infinity,
                child: const Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                )),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize(context).getSize.width * 0.05,
              ),
              child: SizedBox(
                height: ScreenSize(context).getSize.height * 0.17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight5,
                    const Text(
                      " Hotels & Restaurant",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    kHeight5,
                    Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: ScreenSize(context).getSize.width *
                                        0.05,
                                  ),
                                  child: Container(
                                    height: ScreenSize(context).getSize.height *
                                        0.09,
                                    width: ScreenSize(context).getSize.width *
                                        0.18,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kColorHint),
                                        color: buttonTextColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6))),
                                  ),
                                ),
                                kHeight5,
                                const Text(
                                  'Tiga Vision',
                                  style: TextStyle(
                                    color: gridTextColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                kHeight5,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Center(
                                      child: Text(
                                        '4.2 ',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 6,
                                    )
                                  ],
                                ),
                                kWidth5,
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              color: kColorHint,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize(context).getSize.width * 0.05,
              ),
              child: SizedBox(
                height: ScreenSize(context).getSize.height * 0.17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight5,
                    const Text(
                      " Supermarket",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    kHeight5,
                    Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: ScreenSize(context).getSize.width *
                                        0.05,
                                  ),
                                  child: Container(
                                    height: ScreenSize(context).getSize.height *
                                        0.09,
                                    width: ScreenSize(context).getSize.width *
                                        0.18,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kColorHint),
                                        color: buttonTextColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6))),
                                  ),
                                ),
                                kHeight5,
                                const Text(
                                  'Tiga Vision',
                                  style: TextStyle(
                                    color: gridTextColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                kHeight5,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Center(
                                      child: Text(
                                        '4.2 ',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 6,
                                    )
                                  ],
                                ),
                                kWidth5,
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              color: kColorHint,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize(context).getSize.width * 0.05,
              ),
              child: SizedBox(
                height: ScreenSize(context).getSize.height * 0.17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight5,
                    const Text(
                      " Other Shops",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    kHeight5,
                    Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: ScreenSize(context).getSize.width *
                                        0.05,
                                  ),
                                  child: Container(
                                    height: ScreenSize(context).getSize.height *
                                        0.09,
                                    width: ScreenSize(context).getSize.width *
                                        0.18,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kColorHint),
                                        color: buttonTextColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6))),
                                  ),
                                ),
                                kHeight5,
                                const Text(
                                  'Tiga Vision',
                                  style: TextStyle(
                                    color: gridTextColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                kHeight5,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Center(
                                      child: Text(
                                        '4.2 ',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 6,
                                    )
                                  ],
                                ),
                                kWidth5,
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
