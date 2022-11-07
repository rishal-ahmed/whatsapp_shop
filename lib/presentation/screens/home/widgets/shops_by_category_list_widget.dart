import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/base_url.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/images.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/shop/shop_model.dart';

class ShopsByCategoryListWidget extends StatelessWidget {
  const ShopsByCategoryListWidget({
    Key? key,
    required this.category,
    required this.shops,
  }) : super(key: key);

  final String category;
  final List<ShopModel> shops;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      height: 20.h,
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: TextStyle(color: primaryColor, fontSize: 14.sp),
          ),
          dHeight1,
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final ShopModel shop = shops[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, routeMain, arguments: shop.id);
                  },
                  child: SizedBox(
                    width: 10.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 9.h,
                          width: 9.h,
                          decoration: BoxDecoration(
                              color: const Color(0XFF199A2D),
                              borderRadius: BorderRadius.circular(10)),
                          child: shop.logo != null
                              ? Image.network(
                                  kImageAppendUrl + shop.logo!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Image.asset(
                                      kImageEre,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Image.asset(
                                    kImageEre,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        dHeight05,
                        Flexible(
                          child: Text(
                            shop.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 1,
                          ),
                        ),
                        dHeight03,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '4.2',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            dWidth05,
                            Icon(
                              Icons.star,
                              color: primaryColor,
                              size: 12.sp,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return dWidth3;
              },
              itemCount: shops.length,
            ),
          ),
        ],
      ),
    );
  }
}
