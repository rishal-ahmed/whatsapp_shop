import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/screens/shops/Screen_shop4.dart';

class ScreenShop3 extends StatelessWidget {
  const ScreenShop3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: ScreenSize(context).getSize.width * 0.05,
              ),
              child: SizedBox(
                height: ScreenSize(context).getSize.height * 0.13,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          " Top Categories",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: ScreenSize(context).getSize.width * 0.09,
                          ),
                          child: const Text(
                            " View all",
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    kHeight10,
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
                                      height:
                                          ScreenSize(context).getSize.height *
                                              0.06,
                                      width: ScreenSize(context).getSize.width *
                                          0.12,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: secondaryColor,
                                      ),
                                    )),
                                kHeight5,
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: ScreenSize(context).getSize.width *
                                        0.05,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Chairs',
                                      style: TextStyle(
                                        color: gridTextColor,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                kHeight5,
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenShop4()));
              },
              child: SizedBox(
                  height: ScreenSize(context).getSize.height * 0.21,
                  width: double.infinity,
                  child: const Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                  )),
            ),
            kHeight10,
            Container(
              height: ScreenSize(context).getSize.height * 0.20,
              width: double.infinity,
              color: buttonTextColor,
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenSize(context).getSize.width * 0.05,
                  top: ScreenSize(context).getSize.height * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenSize(context).getSize.width * 0.01,
                        right: ScreenSize(context).getSize.height * 0.020,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Featured Products',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'View All',
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    kHeight10,
                    Expanded(
                      child: ListView.builder(
                          itemCount: 20,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            ScreenSize(context).getSize.width *
                                                0.05,
                                      ),
                                      child: Container(
                                        height:
                                            ScreenSize(context).getSize.height *
                                                0.10,
                                        width:
                                            ScreenSize(context).getSize.width *
                                                0.23,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: kColorHint),
                                            color: buttonTextColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft: Radius.circular(6),
                                                    topRight:
                                                        Radius.circular(6))),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.pink,
                                          radius: 6,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 5,
                                        left: 60,
                                        child: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: textColor,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                " 30%",
                                                style: TextStyle(
                                                  color: buttonTextColor,
                                                  fontSize: 3,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                " Off",
                                                style: TextStyle(
                                                  color: buttonTextColor,
                                                  fontSize: 3,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                                kHeight5,
                                const Text(
                                  'Mesh-staff chair',
                                  style: TextStyle(
                                    color: gridTextColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                kHeight5,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '₹590',
                                      style: TextStyle(
                                        color: secondaryColor,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    kWidth5,
                                    Text(
                                      '₹700',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: gridTextColor,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: ScreenSize(context).getSize.height * 0.21,
                width: double.infinity,
                child: const Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                )),
            Container(
              height: ScreenSize(context).getSize.height * 0.20,
              width: double.infinity,
              color: buttonTextColor,
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenSize(context).getSize.width * 0.05,
                  top: ScreenSize(context).getSize.height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenSize(context).getSize.width * 0.01,
                        right: ScreenSize(context).getSize.height * 0.020,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Trending Products',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'View All',
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    kHeight10,
                    Expanded(
                      child: ListView.builder(
                          itemCount: 20,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            ScreenSize(context).getSize.width *
                                                0.05,
                                      ),
                                      child: Container(
                                        height:
                                            ScreenSize(context).getSize.height *
                                                0.10,
                                        width:
                                            ScreenSize(context).getSize.width *
                                                0.23,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: kColorHint),
                                            color: buttonTextColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft: Radius.circular(6),
                                                    topRight:
                                                        Radius.circular(6))),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.pink,
                                          radius: 6,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 5,
                                        left: 60,
                                        child: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: textColor,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                " 30%",
                                                style: TextStyle(
                                                  color: buttonTextColor,
                                                  fontSize: 3,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                " Off",
                                                style: TextStyle(
                                                  color: buttonTextColor,
                                                  fontSize: 3,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                                kHeight5,
                                const Text(
                                  'Mesh-staff chair',
                                  style: TextStyle(
                                    color: gridTextColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                kHeight5,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '₹590',
                                      style: TextStyle(
                                        color: secondaryColor,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    kWidth5,
                                    Text(
                                      '₹700',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: gridTextColor,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: ScreenSize(context).getSize.height * 0.21,
                width: double.infinity,
                child: const Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                )),
            Container(
              height: ScreenSize(context).getSize.height * 0.20,
              width: double.infinity,
              color: buttonTextColor,
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenSize(context).getSize.width * 0.05,
                  top: ScreenSize(context).getSize.height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenSize(context).getSize.width * 0.01,
                        right: ScreenSize(context).getSize.height * 0.020,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Trending Products',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'View All',
                            style: TextStyle(
                              color: secondaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    kHeight10,
                    Expanded(
                      child: ListView.builder(
                          itemCount: 20,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            ScreenSize(context).getSize.width *
                                                0.05,
                                      ),
                                      child: Container(
                                        height:
                                            ScreenSize(context).getSize.height *
                                                0.10,
                                        width:
                                            ScreenSize(context).getSize.width *
                                                0.23,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: kColorHint),
                                            color: buttonTextColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft: Radius.circular(6),
                                                    topRight:
                                                        Radius.circular(6))),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.pink,
                                          radius: 6,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 5,
                                        left: 60,
                                        child: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: textColor,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                " 30%",
                                                style: TextStyle(
                                                  color: buttonTextColor,
                                                  fontSize: 3,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                " Off",
                                                style: TextStyle(
                                                  color: buttonTextColor,
                                                  fontSize: 3,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                                kHeight5,
                                const Text(
                                  'Mesh-staff chair',
                                  style: TextStyle(
                                    color: gridTextColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                kHeight5,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '₹590',
                                      style: TextStyle(
                                        color: secondaryColor,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    kWidth5,
                                    Text(
                                      '₹700',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: gridTextColor,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
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
