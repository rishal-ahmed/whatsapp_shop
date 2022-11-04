import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/home/home_event.dart';
import 'package:whatsapp_shop/application/home/home_notifier.dart';
import 'package:whatsapp_shop/application/home/home_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/shop_category/shop_category_model.dart';
import 'package:whatsapp_shop/infrastructure/home/home_repository.dart';
import 'package:whatsapp_shop/presentation/screens/home/widgets/shops_by_category_list_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/dropdown/dropdown_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/search_text_field_widget.dart.dart';

final _homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier()..emit(const HomeEvent.home());
});

final _shopCategoryIdProvider = StateProvider<String>((ref) => '0');

class ScreenHome extends ConsumerWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //==================== Search Field ====================
            Container(
              color: const Color(0XFFE2E2E2),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Consumer(
                      builder: (context, ref, _) {
                        final state = ref.watch(_homeProvider);

                        List<ShopCategoryModel> shopCategories = [
                          const ShopCategoryModel(id: 0, name: 'All Shops'),
                        ];

                        if (state.isLoading) {
                          return DropDownWidget(
                            items: shopCategories,
                            value: shopCategories.first,
                          );
                        }

                        if (state.isError) {
                          return const Center(
                            child: Text('Something went wrong'),
                          );
                        } else {
                          shopCategories = [
                            ...shopCategories,
                            ...state.shopCategories
                          ];
                          return DropDownWidget(
                            items: shopCategories,
                            value: shopCategories.first,
                            onChanged: (shopCategory) {
                              log('shopCategoryId ==== ${shopCategory!.id}');
                              ref.read(_shopCategoryIdProvider.notifier).state =
                                  shopCategory.id.toString();
                            },
                          );
                        }
                      },
                    ),
                  ),
                  dWidth2,
                  Expanded(
                    flex: 7,
                    child: SearchTextField(
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
                      itemBuilder: (context, shop) {
                        return Container(
                          color: kTransparentColor,
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            shop.name,
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        );
                      },
                      noItemsFoundBuilder: (context) {
                        return Container(
                            color: kTransparentColor,
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              'No shop found!',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: kColorHint,
                              ),
                            ));
                      },
                      onSuggestionSelected: (shop) {
                        log('shop = ${shop.name}');
                      },
                      suggestionsCallback: (pattern) async {
                        final shopCategoryId =
                            ref.read(_shopCategoryIdProvider);
                        final state = await HomeRepository().search(
                          shopCategoryId: shopCategoryId,
                          keyword: pattern,
                        );

                        return state.fold((l) => throw Exception, (r) => r);
                      },
                    ),
                  ),
                ],
              ),
            ),

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
            //==================== Newest Shops ====================
            Consumer(
              builder: (context, ref, _) {
                final HomeState state = ref.watch(_homeProvider);

                if (state.isLoading) {
                  return SizedBox(
                    height: 20.h,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (state.isError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                return ShopsByCategoryListWidget(
                  category: 'Newest Shops',
                  shops: state.newShops,
                );
              },
            ),
            kHeight1,
            //==================== Advertisement Slider ====================
            Consumer(
              builder: (context, ref, _) {
                return ImageSlideshow(
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image.network(
                      'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://images.pexels.com/photos/265144/pexels-photo-265144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      fit: BoxFit.cover,
                    ),
                  ],
                );
              },
            ),
            kHeight1,
            // //==================== Hotels & Restaurant ====================
            Consumer(
              builder: (context, ref, _) {
                final HomeState state = ref.watch(_homeProvider);

                if (state.isLoading) {
                  return SizedBox(
                    height: 20.h,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (state.isError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                return ShopsByCategoryListWidget(
                  category: 'Hotels & Restaurant',
                  shops: state.hotelsRestaurants,
                );
              },
            ),

            kHeight1,
            //==================== Supermarket ====================
            Consumer(
              builder: (context, ref, _) {
                final HomeState state = ref.watch(_homeProvider);

                if (state.isLoading) {
                  return SizedBox(
                    height: 20.h,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (state.isError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                return ShopsByCategoryListWidget(
                  category: 'Supermarket',
                  shops: state.superMarkets,
                );
              },
            ),
            kHeight1,
            //==================== Other Shops ====================
            Consumer(
              builder: (context, ref, _) {
                final HomeState state = ref.watch(_homeProvider);

                if (state.isLoading) {
                  return SizedBox(
                    height: 20.h,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (state.isError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                return ShopsByCategoryListWidget(
                  category: 'Other Shops',
                  shops: state.otherShops,
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
