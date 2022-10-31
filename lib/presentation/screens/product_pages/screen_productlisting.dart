import 'package:flutter/material.dart';
import 'package:whatsapp_shop/presentation/screens/product_pages/screen_product_singleview.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/text_field_widget.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';

class ScreenProductListing extends StatefulWidget {
  const ScreenProductListing({super.key});

  @override
  State<ScreenProductListing> createState() => _ScreenProductListingState();
}

class _ScreenProductListingState extends State<ScreenProductListing> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: productListbgColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: ScreenSize(context).getSize.width * 0.03,
          horizontal: ScreenSize(context).getSize.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 26,
              child: TextFeildWidget(
                textInputType: TextInputType.visiblePassword,
                contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
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
            kHeight5,
            const Text(
              'Showing search result for “Chairs”',
              style: TextStyle(
                color: searchTextColor,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            kHeight25,
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 2.5,
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 18),
                  itemCount: 9,
                  itemBuilder: (BuildContext ctx, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Stack(children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ScreenProductSingleView()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: kColorHint),
                                    color: buttonTextColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6))),
                                child: const CircleAvatar(
                                    backgroundColor: Colors.pink),
                              ),
                            ),
                            Positioned(
                                left: ScreenSize(context).getSize.width * 0.22,
                                top: ScreenSize(context).getSize.height * 0.005,
                                right: ScreenSize(context).getSize.width * 0.01,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: textColor,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          ]),
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
      )),
    );
  }
}
