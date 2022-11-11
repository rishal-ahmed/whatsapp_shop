import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/cart/cart_event.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/cart/cart_model.dart';
import 'package:whatsapp_shop/domain/provider/cart_provider.dart';
import 'package:whatsapp_shop/domain/utils/snackbars/snackbar.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

// final _changeQuanityCartProvider =
//     AutoDisposeStateNotifierProvider<CartNotifier, CartState>(
//   (ref) {
//     return CartNotifier();
//   },
// );

class CartItemWidget extends ConsumerWidget {
  const CartItemWidget({
    Key? key,
    required this.cartItem,
    required this.shimmer,
  }) : super(key: key);

  final CartModel? cartItem;
  final bool shimmer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShimmerWidget(
      isLoading: shimmer,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kColorBorder)
            // color: kBlueGrey,
            ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 0.5.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //=== Item Image ===
              Container(
                width: 22.w,
                height: 22.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kColorBorder),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1542219550-37153d387c27?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              dWidth2,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 7,
                        child: SizedBox(
                          height: 20.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    !shimmer
                                        ? cartItem!.productName
                                        : 'Product Name',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              dHeight03,
                              Text.rich(
                                TextSpan(
                                  text: !shimmer
                                      ? '₹${cartItem!.unitPrice}  '
                                      : '₹0.00  ',
                                  style: TextStyle(
                                    fontSize: 13.5.sp,
                                    decorationThickness: 2,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: !shimmer
                                          ? '${cartItem!.unitOfferPrice}'
                                          : '₹0.00',
                                      style: TextStyle(
                                        fontSize: 12.5.sp,
                                        decoration: TextDecoration.lineThrough,
                                        color: kColorDim2,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              dHeight05,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 5,
                                    child: Container(
                                      height: 3.5.h,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: kColorBorder2)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          FittedBox(
                                            child: Icon(
                                              Icons.remove,
                                              color: primaryTextColor,
                                              size: 16.sp,
                                            ),
                                          ),
                                          kWidth2,
                                          Flexible(
                                            child: Text(
                                              !shimmer
                                                  ? '${cartItem!.quantity}'
                                                  : '1',
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: primaryTextColor,
                                                fontSize: 14.sp,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          kWidth2,
                                          FittedBox(
                                            child: InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.add,
                                                color: primaryTextColor,
                                                size: 16.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Flexible(child: kNone),

                                  //========== Remove Cart Item Button ==========
                                  Flexible(
                                    flex: 5,
                                    child: Consumer(
                                      builder: (context, ref, _) {
                                        return SizedBox(
                                          height: 3.5.h,
                                          child: OutlinedButton(
                                            onPressed: !shimmer
                                                ? () {
                                                    ref
                                                        .read(CartProvider
                                                            .removeCartProvider
                                                            .notifier)
                                                        .emit(
                                                          CartEvent.cartRemove(
                                                              cartId:
                                                                  cartItem!.id),
                                                        );

                                                    ref.listenManual(
                                                      CartProvider
                                                          .removeCartProvider,
                                                      (previous, next) {
                                                        log('previous = ${previous?.status}');
                                                        log('next = ${next.status}');
                                                        if (!next.isLoading &&
                                                            next.status) {
                                                          ref.invalidate(
                                                              CartProvider
                                                                  .cartsProvider);
                                                          ref.invalidate(
                                                              CartProvider
                                                                  .cartSumProvider);
                                                          ref.invalidate(
                                                              CartProvider
                                                                  .cartCountProvider);

                                                          return kSnackBar(
                                                            context: context,
                                                            content:
                                                                'Cart removed successfully',
                                                            success: true,
                                                          );
                                                        }
                                                      },
                                                    );
                                                  }
                                                : null,
                                            child: FittedBox(
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0XFF989898),
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Text(
                          'In Stock',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
