import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/product_category/product_category_model.dart';
import 'package:whatsapp_shop/presentation/screens/shops/widgets/shop_product_category_list_widget.dart';
import 'package:whatsapp_shop/presentation/screens/shops/widgets/shop_product_list_widget.dart';

class ScreenShop extends StatelessWidget {
  const ScreenShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //==================== Advertisement Slider ====================
            Consumer(
              builder: (context, ref, _) {
                return ImageSlideshow(
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image.network(
                      'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                  ],
                );
              },
            ),

            const ShopProductCategoryList(
              title: 'Top Categories',
              productCategories: [
                ProductCategoryModel(
                    id: 1,
                    shopId: 1,
                    name: 'Mobiles',
                    displayOrder: 1,
                    image: ''),
                ProductCategoryModel(
                    id: 1,
                    shopId: 1,
                    name: 'Laptops',
                    displayOrder: 1,
                    image: ''),
                ProductCategoryModel(
                    id: 1, shopId: 1, name: 'TV', displayOrder: 1, image: ''),
                ProductCategoryModel(
                    id: 1,
                    shopId: 1,
                    name: 'Refrigerator',
                    displayOrder: 1,
                    image: ''),
                ProductCategoryModel(
                    id: 1, shopId: 1, name: 'AC', displayOrder: 1, image: ''),
                ProductCategoryModel(
                    id: 1,
                    shopId: 1,
                    name: 'Watch',
                    displayOrder: 1,
                    image: ''),
              ],
            ),
            kHeight1,

            const ShopProductList(title: 'Featured Products', products: []),
            kHeight1,

            //==================== Advertisement Slider ====================
            Consumer(
              builder: (context, ref, _) {
                return ImageSlideshow(
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image.network(
                      'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                  ],
                );
              },
            ),
            kHeight1,

            const ShopProductList(title: 'Trending Products', products: []),
            kHeight1,

            //==================== Advertisement Slider ====================
            Consumer(
              builder: (context, ref, _) {
                return ImageSlideshow(
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image.network(
                      'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                  ],
                );
              },
            ),
            kHeight1,

            const ShopProductList(title: 'Featured Products', products: []),
            kHeight1,
          ],
        ),
      ),
    );
  }
}
