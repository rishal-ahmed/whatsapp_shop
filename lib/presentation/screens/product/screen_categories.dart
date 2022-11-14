import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/domain/models/product_category/product_category_model.dart';
import 'package:whatsapp_shop/presentation/screens/shops/widgets/shop_product_category_item_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories(
      {super.key, required this.title, required this.categories});
  final String title;
  final List<ProductCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: title),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 3.w,
            mainAxisSpacing: 3.w,
          ),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final ProductCategoryModel category = categories[index];

            //========== Product Category Item Widget ==========
            return ProductCategoryItemWidget(category: category);
          },
        ),
      ),
    );
  }
}
