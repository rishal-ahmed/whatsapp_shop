import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/home/home_event.dart';
import 'package:whatsapp_shop/application/home/home_notifier.dart';
import 'package:whatsapp_shop/application/home/home_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/domain/models/shop_category/shop_category_model.dart';
import 'package:whatsapp_shop/presentation/screens/home/widgets/shops_by_category_list_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/dropdown/dropdown_widget.dart';

import '../../../core/constants/sizes.dart';
import '../../widgets/text_fields/text_field_widget.dart';

const List<String> shops = [
  'All Shops',
  'ABC Shops',
  'DD House',
  'AX Hotel',
];

final _homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier()..emit(const HomeEvent.home());
});

class ScreenHome extends ConsumerWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //==================== Search Field ====================
            Container(
              color: const Color(0XFFE2E2E2),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: Row(
                children: [
                  //========== All Shops ~ DropDown ==========
                  Expanded(
                    flex: 3,
                    child: Consumer(
                      builder: (context, ref, _) {
                        final state = ref.watch(_homeProvider);

                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state.isError) {
                          return const Center(
                            child: Text('Something went wrong'),
                          );
                        } else {
                          final List<ShopCategoryModel> shopCategories = [
                            const ShopCategoryModel(id: 0, name: 'All Shops'),
                            ...state.shopCategories!
                          ];

                          return DropDownWidget(
                            items: shopCategories,
                            value: const ShopCategoryModel(
                                id: 0, name: 'All Shops'),
                          );
                        }
                      },
                    ),
                  ),
                  dWidth2,
                  Expanded(
                    flex: 7,
                    child: TextFeildWidget(
                      inputBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: searchBorderColor),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(8),
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                  ),
                ],
              ),
            ),

            //==================== Banner Image ====================
            SizedBox(
                height: 22.h,
                width: double.infinity,
                child: const Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                )),
            kHeight1,
            //==================== Shop Listing ====================
            const ShopsByCategoryListWidget(category: 'Newest Shops'),
            kHeight1,
            SizedBox(
              height: 22.h,
              width: double.infinity,
              child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
              ),
            ),
            kHeight1,
            //==================== Shop Listing ====================
            const ShopsByCategoryListWidget(category: 'Hotels & Restaurant'),

            kHeight1,
            //==================== Shop Listing ====================
            const ShopsByCategoryListWidget(category: 'Supermarket'),
            kHeight1,
            //==================== Shop Listing ====================
            const ShopsByCategoryListWidget(category: 'Other Shops'),
          ],
        ),
      )),
    );
  }
}
