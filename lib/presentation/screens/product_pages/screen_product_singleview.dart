import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';

class ScreenProductSingleView extends StatelessWidget {
  const ScreenProductSingleView({super.key});
  final String dropdownvalue = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: productListbgColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 9,
            ),
          ),
          title: const Text(
            'Chairs',
            style: TextStyle(fontSize: 10),
          ),
          actions: const [
            Icon(
              Icons.shopping_cart,
              size: 16,
            ),
            kWidth20,
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: ScreenSize(context).getSize.height * 0.06,
                color: productListbgColor,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: ScreenSize(context).getSize.width * 0.30,
                    left: ScreenSize(context).getSize.width * 0.07,
                  ),
                  child: const Center(
                    child: Text(
                      'Zero Gravity Portable Textilene Fabric and Steel Reclining Lounge Chiaair, Blue',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: buttonTextColor,
                height: ScreenSize(context).getSize.height * 0.28,
                child: CarouselSlider(
                  items: [
                    Stack(children: [
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://images.squarespace-cdn.com/content/v1/59161c8b9de4bb090c23d7b7/1552425613573-UY3EQU7FR9ZP9OQR1CHK/purple+office+chair.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Positioned(
                            left: 20,
                            top: 20,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: textColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    " 30%",
                                    style: TextStyle(
                                      color: buttonTextColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    " Off",
                                    style: TextStyle(
                                      color: buttonTextColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      )
                    ]),

                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://images.squarespace-cdn.com/content/v1/59161c8b9de4bb090c23d7b7/1552425613573-UY3EQU7FR9ZP9OQR1CHK/purple+office+chair.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://images.squarespace-cdn.com/content/v1/59161c8b9de4bb090c23d7b7/1552425613573-UY3EQU7FR9ZP9OQR1CHK/purple+office+chair.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://images.squarespace-cdn.com/content/v1/59161c8b9de4bb090c23d7b7/1552425613573-UY3EQU7FR9ZP9OQR1CHK/purple+office+chair.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: double.infinity,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 1 / 2,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
              kHeight5,
              Container(
                height: ScreenSize(context).getSize.height * 0.33,
                decoration: BoxDecoration(
                  border: Border.all(color: productListbgColor),
                  color: buttonTextColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: ScreenSize(context).getSize.width * 0.05,
                    right: ScreenSize(context).getSize.width * 0.05,
                    top: ScreenSize(context).getSize.height * 0.03,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: const [
                                    Text(
                                      'MRP :',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      '₹5300',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '₹3600',
                                      style: TextStyle(
                                        color: alertColors,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'In Stock.',
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                kHeight5,
                                Row(children: [
                                  Container(
                                    height: 13,
                                    width: 51,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: kColorHint,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Center(
                                            child: Text(
                                              'Qty : ',
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              value: dropdownvalue,
                                              iconSize: 15,
                                              iconEnabledColor: textColor,
                                              onChanged: (newValue) {},
                                              items: <String>[
                                                '1',
                                                '2',
                                                '3',
                                                '4',
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  value: value,
                                                  child: Center(
                                                    child: Text(
                                                      value,
                                                      style: const TextStyle(
                                                          fontSize: 9,
                                                          color: primaryColor),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            )
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: ScreenSize(context).getSize.height * 0.04,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 43,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: secondaryColor),
                              child: const Center(
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: buttonTextColor,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: ScreenSize(context).getSize.height * 0.01,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 43,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: primaryColor),
                                child: const Center(
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                      color: buttonTextColor,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        kHeight25,
                        const Text(
                          'Quick Overview',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        kHeight5,
                        const Text(
                          'Chair',
                          style: TextStyle(
                            color: kColorHint,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Container(
                height: ScreenSize(context).getSize.height * 0.22,
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
                          right: ScreenSize(context).getSize.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Similar Products',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'View More',
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
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right: ScreenSize(context)
                                                    .getSize
                                                    .width *
                                                0.05,
                                          ),
                                          child: Container(
                                            height: ScreenSize(context)
                                                    .getSize
                                                    .height *
                                                0.10,
                                            width: ScreenSize(context)
                                                    .getSize
                                                    .width *
                                                0.23,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: kColorHint),
                                                color: buttonTextColor,
                                                borderRadius: const BorderRadius
                                                        .only(
                                                    topLeft: Radius.circular(6),
                                                    topRight:
                                                        Radius.circular(6))),
                                            child: const CircleAvatar(
                                              backgroundColor: Colors.pink,
                                              radius: 6,
                                            ),
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
                                          decoration:
                                              TextDecoration.lineThrough,
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
              const SizedBox(
                height: 3,
              ),
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
                          right: ScreenSize(context).getSize.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Similar Products',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'View More',
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
                                          right: ScreenSize(context)
                                                  .getSize
                                                  .width *
                                              0.05,
                                        ),
                                        child: Container(
                                          height: ScreenSize(context)
                                                  .getSize
                                                  .height *
                                              0.10,
                                          width: ScreenSize(context)
                                                  .getSize
                                                  .width *
                                              0.23,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: kColorHint),
                                              color: buttonTextColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(6),
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
                                          decoration:
                                              TextDecoration.lineThrough,
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
              )
            ]),
          ),
        ));
  }
}
