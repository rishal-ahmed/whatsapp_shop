import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/cart/cart_event.dart';
import 'package:whatsapp_shop/application/cart/cart_state.dart';
import 'package:whatsapp_shop/application/product/product_event.dart';
import 'package:whatsapp_shop/application/product/product_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/user/user_model.dart';
import 'package:whatsapp_shop/domain/provider/cart_provider.dart';
import 'package:whatsapp_shop/domain/provider/product_provider.dart';
import 'package:whatsapp_shop/domain/utils/snackbars/snackbar.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';
import 'package:whatsapp_shop/presentation/screens/shops/widgets/shop_product_list_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';
import 'package:whatsapp_shop/presentation/widgets/buttons/custom_material_button.dart';
import 'package:whatsapp_shop/presentation/widgets/dropdown/custom_dropdown_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/errors/errors.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class ScreenProduct extends ConsumerWidget {
  const ScreenProduct({required this.productId, super.key});
  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('Screen Product => Build()');
    final ProductState state = ref.watch(ProductProvider.productProvider(
        ProductEvent.product(productId: productId)));

    ref.listen(
      CartProvider.addToCartProvider,
      (previous, next) {
        if (!next.isLoading && next.status) {
          ref.invalidate(CartProvider.cartCountProvider);
          return kSnackBar(
            context: context,
            content: 'Added to cart',
            success: true,
            duration: 2,
          );
        }

        if (!next.isLoading && next.isError) {
          return kSnackBar(
            context: context,
            content: 'Oops, Something went wrong. please try again later.',
            error: true,
          );
        }
      },
    );
    return Scaffold(
      appBar: const AppBarWidget(defualt: true),
      backgroundColor: state.isError ? kWhite : kBackgroundColor,
      body: SafeArea(
        child: state.isError
            ? const SomethingWentWrongWidget()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    //==================== Product Title & Image Field ====================
                    Container(
                      color: kWhite,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //========== Product Title ==========
                          Consumer(
                            builder: (context, ref, _) {
                              //===== Loading =====
                              if (state.isLoading) {
                                return ShimmerWidget(
                                    child: Container(
                                        color: kWhite,
                                        width: double.infinity,
                                        child: Text('',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: primaryTextColor,
                                            ))));
                              }

                              //===== Success =====
                              return Text(
                                state.product!.name,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: primaryTextColor,
                                ),
                              );
                            },
                          ),
                          dHeight2,
                          //========== Product Image Slider ==========
                          Consumer(
                            builder: (context, ref, _) {
                              //===== Loading =====
                              if (state.isLoading) {
                                return ShimmerWidget(
                                    child: Container(
                                        color: kWhite,
                                        height: 200,
                                        width: double.infinity));
                              }

                              //===== Success =====
                              return Stack(
                                children: [
                                  ImageSlideshow(
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
                                  ),
                                  //========== Offer Circle ==========
                                  const Positioned(
                                    right: 5,
                                    top: 5,
                                    child: CircleAvatar(
                                      backgroundColor: primaryTextColor,
                                      radius: 15,
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
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
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    kHeight1,

                    //==================== Cart & Buy Field ====================
                    Consumer(
                      builder: (context, ref, _) {
                        return Container(
                          color: kWhite,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //========== Prices Field ==========
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ShimmerWidget(
                                        isLoading: state.isLoading,
                                        child: Text(
                                          'MRP : ',
                                          style: TextStyle(
                                              color: primaryTextColor,
                                              fontSize: 14.5.sp),
                                        ),
                                      ),
                                      state.isLoading
                                          ? ShimmerWidget(
                                              child: Text.rich(
                                                TextSpan(
                                                  text: '₹00.0\n',
                                                  style: TextStyle(
                                                    fontSize: 14.5.sp,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationThickness: 2,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: '₹00.0',
                                                      style: TextStyle(
                                                        fontSize: 14.5.sp,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Text.rich(
                                              TextSpan(
                                                text:
                                                    '₹${state.units.first.price}\n',
                                                style: TextStyle(
                                                  fontSize: 14.5.sp,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationThickness: 2,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '₹${state.units.first.offerPrice}',
                                                    style: TextStyle(
                                                      fontSize: 14.5.sp,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: const Color(
                                                          0XFFFF0404),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ],
                                  ),
                                  //========== Quantity Field ==========
                                  Column(
                                    children: [
                                      state.isLoading
                                          ? ShimmerWidget(
                                              child: Text(
                                                'In Stock',
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              ),
                                            )
                                          : Text(
                                              state.product!.status ==
                                                      'Available'
                                                  ? 'In Stock'
                                                  : 'Out of Stock',
                                              style: TextStyle(
                                                color: state.product!.status ==
                                                        'Available'
                                                    ? secondaryTextColor
                                                    : kRed,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                      dHeight05,
                                      ShimmerWidget(
                                        isLoading: state.isLoading,
                                        child: CustomDropDownWidget(
                                          width: 15.w,
                                          preText: 'Qty:  ',
                                          value: '1',
                                          items: const [
                                            '1',
                                            '2',
                                            '3',
                                            '4',
                                            '5',
                                            '6',
                                          ],
                                          onChanged: (value) {
                                            log('qty = $value');
                                          },
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              dHeight1,
                              //========== Cart Button ==========
                              Consumer(
                                builder: (context, ref, _) {
                                  log('Add to cart .....');
                                  final CartState cartState =
                                      ref.watch(CartProvider.addToCartProvider);

                                  return CustomMaterialBtton(
                                    buttonText: 'Add to Cart',
                                    color: secondaryColor,
                                    borderColor: secondaryColor,
                                    borderRadius: BorderRadius.circular(12),
                                    shimmer: state.isLoading,
                                    isLoading: cartState.isLoading,
                                    onPressed: () {
                                      final UserModel user =
                                          UserUtils.instance.userModel!;

                                      ref
                                          .read(CartProvider
                                              .addToCartProvider.notifier)
                                          .emit(
                                            CartEvent.addCart(
                                              userId: user.id,
                                              productId: productId,
                                              unitId: state.units.first.id,
                                              quantity: 1,
                                            ),
                                          );
                                    },
                                  );
                                },
                              ),
                              dHeight05,
                              //========== Buy Button ==========
                              CustomMaterialBtton(
                                onPressed: () {},
                                buttonText: 'Buy Now',
                                color: primaryColor,
                                borderColor: primaryColor,
                                borderRadius: BorderRadius.circular(12),
                                shimmer: state.isLoading,
                              ),

                              dHeight2,
                              ShimmerWidget(
                                isLoading: state.isLoading,
                                child: Text(
                                  'Quick Review',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: primaryTextColor,
                                  ),
                                ),
                              ),
                              kHeight2,
                              state.isLoading
                                  ? ShimmerWidget(
                                      child: Text(
                                        'Awesome product for home and business uses..',
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: kColorDim,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      state.product!.description,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: kColorDim,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                            ],
                          ),
                        );
                      },
                    ),
                    kHeight2,

                    //==================== Similar Products Field ====================
                    Consumer(
                      builder: (context, ref, _) {
                        if (!state.isLoading && state.similarProducts.isEmpty) {
                          return kNone;
                        }
                        return ShopProductList(
                          title: 'Similar Products',
                          products: state.similarProducts,
                          shimmer: state.isLoading,
                          refresh: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
