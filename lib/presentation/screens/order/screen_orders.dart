import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/order/order_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/order/order_model.dart';
import 'package:whatsapp_shop/domain/provider/order/order_provider.dart';
import 'package:whatsapp_shop/domain/utils/converter/converter.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';
import 'package:whatsapp_shop/presentation/widgets/errors/errors.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class ScreenOrders extends ConsumerWidget {
  const ScreenOrders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OrderState state = ref.watch(OrderProvider.ordersProvider);
    final ordersProvider = StateProvider.autoDispose<List<OrderModel>>((ref) {
      return state.orders;
    });

    return Scaffold(
      appBar: const AppBarWidget(title: 'Orders'),
      backgroundColor: state.isLoading ? kWhite : kBackgroundColor,
      body: state.isError
          ? const SomethingWentWrongWidget()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!state.isLoading)
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, _) {
                          final List<OrderModel> orders =
                              ref.watch(ordersProvider);

                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final OrderModel order = orders[index];
                              //==================== Order Item Widget ====================
                              return Card(
                                child: ListTile(
                                  dense: true,
                                  title: Text(
                                    'Order id: ${order.id}',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: primaryTextColor,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      dHeight1,
                                      //========== Amounts ==========
                                      Text.rich(
                                        TextSpan(
                                          text: '₹${order.amount}  ',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              decorationThickness: 2,
                                              fontWeight: FontWeight.w600,
                                              color: primaryColor),
                                          children: [
                                            if (order.discount != 0)
                                              TextSpan(
                                                text: '₹0.00',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: kColorDim2,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      dHeight05,
                                    ],
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      //========== Payment Status ==========
                                      Text(
                                        order.paymentStatus,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color:
                                              order.paymentStatus != 'Delivered'
                                                  ? kRed
                                                  : secondaryColor,
                                        ),
                                      ),

                                      //========== Order Date ==========
                                      Text(
                                        'Date: ${ConverterUtils.dateFormatEInvoice.format(DateTime.parse(order.orderDate))}',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return dHeight05;
                            },
                            itemCount: orders.length,
                          );
                        },
                      ),
                    )
                  else
                    //==================== Shimmer Widget ====================
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ShimmerWidget(
                            height: 10.h,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return dHeight1;
                        },
                        itemCount: 18,
                      ),
                    )
                ],
              ),
            ),
    );
  }
}
