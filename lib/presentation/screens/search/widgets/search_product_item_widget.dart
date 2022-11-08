import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';

class SearchProductItemWidget extends StatelessWidget {
  const SearchProductItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE5E5E5)),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
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
  }
}
