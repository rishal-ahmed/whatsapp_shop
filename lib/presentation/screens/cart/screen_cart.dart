import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/cart/cart_event.dart';
import 'package:whatsapp_shop/application/cart/cart_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/cart/cart_model.dart';
import 'package:whatsapp_shop/domain/provider/cart_provider.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';
import 'package:whatsapp_shop/presentation/screens/cart/widgets/cart_delivery_address_field.dart';
import 'package:whatsapp_shop/presentation/screens/cart/widgets/cart_item_widget.dart';
import 'package:whatsapp_shop/presentation/screens/cart/widgets/cart_title_child_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';
import 'package:whatsapp_shop/presentation/widgets/buttons/custom_material_button.dart';
import 'package:whatsapp_shop/presentation/widgets/errors/errors.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class ScreenCart extends ConsumerWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CartState state = ref.watch(CartProvider.cartsProvider(
        CartEvent.carts(userId: UserUtils.instance.userId)));

    return Scaffold(
      appBar: const AppBarWidget(
          defualt: true, centerTitle: false, title: 'Cart', cartTap: false),
      backgroundColor: state.isLoading ? kWhite : kBackgroundColor,
      body: state.isError
          ? const SomethingWentWrongWidget()
          : SingleChildScrollView(
              child: Column(
                children: [
                  //==================== Cart Items Field ====================
                  Container(
                    color: kWhite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.isLoading ? 2 : state.carts.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        CartModel? cartItem;
                        if (!state.isLoading) {
                          cartItem = state.carts[index];
                        }
                        //========== Cart Item Widget ==========
                        return CartItemWidget(
                          cartItem: cartItem,
                          shimmer: state.isLoading,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return dHeight1;
                      },
                    ),
                  ),

                  kHeight05,

                  //==================== Bill Details Field ====================
                  Consumer(
                    builder: (context, ref, _) {
                      final CartState sumState =
                          ref.watch(CartProvider.cartSumProvider);
                      return CartTitleChildWidget(
                        title: 'Bill Details',
                        shimmer: sumState.isLoading,
                        child: ShimmerWidget(
                          isLoading: sumState.isLoading,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                dense: true,
                                leading: Text(
                                  'Item Total',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                trailing: Text(
                                  sumState.sum != null
                                      ? '₹${sumState.sum}'
                                      : '₹0.00',
                                  style: TextStyle(
                                    fontSize: 14.5.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ListTile(
                                dense: true,
                                leading: Text(
                                  'Delivery charges',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                trailing: Text(
                                  '₹50',
                                  style: TextStyle(
                                    fontSize: 14.5.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              ListTile(
                                dense: true,
                                leading: Text(
                                  'Total Amount',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                trailing: Text(
                                  sumState.sum != null
                                      ? '₹${sumState.sum! + 50}'
                                      : '₹0.00',
                                  style: TextStyle(
                                    fontSize: 14.5.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  kHeight05,
                  //==================== Payment Options Field ====================
                  CartTitleChildWidget(
                    title: 'Payment Options',
                    shimmer: state.isLoading,
                    child: ShimmerWidget(
                      isLoading: state.isLoading,
                      child: Column(
                        children: [
                          RadioListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            value: true,
                            groupValue: true,
                            dense: true,
                            onChanged: (value) {},
                            title: Text(
                              'Would you like to pay online',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                          RadioListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            value: true,
                            groupValue: false,
                            dense: true,
                            onChanged: (value) {},
                            title: Text(
                              'Would you like to pay cash on delivery',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  kHeight05,

                  //==================== Delivery Address Field ====================
                  const CartDeliveryAddressField(),

                  kHeight05,

                  //==================== Buy Button ====================
                  Container(
                    color: kWhite,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      child: CustomMaterialBtton(
                        shimmer: state.isLoading,
                        buttonText: 'Buy Now',
                        color: primaryColor,
                        borderColor: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
