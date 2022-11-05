import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/text_field_widget.dart';

class ScreenSearch extends ConsumerWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //========== Search Field ==========
            TextFeildWidget(
              inputBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: searchBorderColor)),
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              suffixIcon: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: searchBorderColor,
                ),
                child: const Icon(
                  Icons.search,
                  color: Color(0XFF1F2C34),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 30,
                minHeight: 30,
                minWidth: 30,
                maxWidth: 30,
              ),
              hintText: 'Search Products, Category and More',
              fontSize: 12,
            ),
            dHeight1,
            Text(
              'Showing search result for "Shoes"',
              style: TextStyle(
                color: const Color(0xffB6B6B6),
                fontWeight: FontWeight.w300,
                fontSize: 13.sp,
              ),
            ),
            dHeight3,

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffE5E5E5)),
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1542219550-37153d387c27?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 5,
                              top: 5,
                              child: CircleAvatar(
                                backgroundColor: primaryTextColor,
                                radius: 8,
                                child: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: FittedBox(
                                    child: Text(
                                      '30%\nOff',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      dHeight05,
                      Text(
                        'Nike AirJordan 1',
                        style: TextStyle(
                          color: const Color(0xff333333),
                          fontSize: 13.sp,
                        ),
                      ),
                      dHeight03,
                      Text.rich(
                        TextSpan(
                          text: '₹590  ',
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: '₹700',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontSize: 12.sp,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
