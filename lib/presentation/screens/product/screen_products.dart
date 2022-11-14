import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/domain/models/product/product_model.dart';
import 'package:whatsapp_shop/domain/utils/converter/converter.dart';
import 'package:whatsapp_shop/presentation/screens/shops/widgets/shop_product_item_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';

class ScreenProducts extends StatelessWidget {
  const ScreenProducts(
      {super.key, required this.title, required this.products});
  final String title;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: title),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 3.w,
            mainAxisSpacing: 3.w,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final ProductModel product = products[index];
            final String discount = ConverterUtils.numRounderToString(100 *
                (product.unit!.price - product.unit!.offerPrice) /
                product.unit!.price);
            //========== Product Item Widget ==========
            return ShopProductItemWidget(
              product: product,
              discount: discount,
            );
          },
        ),
      ),
    );
  }
}
