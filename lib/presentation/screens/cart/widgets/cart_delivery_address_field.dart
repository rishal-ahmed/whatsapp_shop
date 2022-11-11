import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/cart/cart_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/presentation/screens/cart/widgets/cart_title_child_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/shimmer/shimmer_widget.dart';

class CartDeliveryAddressField extends StatelessWidget {
  const CartDeliveryAddressField({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CartState state;

  @override
  Widget build(BuildContext context) {
    return CartTitleChildWidget(
      title: 'Delivery Address',
      shimmer: state.isLoading,
      child: ShimmerWidget(
        isLoading: state.isLoading,
        child: Column(
          children: [
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: false,
              groupValue: false,
              dense: true,
              onChanged: (value) {},
              title: Row(
                children: [
                  Text(
                    'Rishal Ahmed',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  dWidth1,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: const Color(0XFF039300),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    child: FittedBox(
                      child: Text(
                        'Home',
                        style: TextStyle(fontSize: 11.sp, color: kWhite),
                      ),
                    ),
                  )
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '6282712271',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                  Text(
                    'ERE business solutions, cyberpark, kozhikode, kerala,673636',
                    style: TextStyle(fontSize: 13.sp),
                  )
                ],
              ),
            ),
            dHeight05,
            RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: true,
              groupValue: false,
              dense: true,
              onChanged: (value) {},
              title: Row(
                children: [
                  Text(
                    'Rishal Ahmed',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  dWidth1,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      // color: kGreen,
                      color: const Color(0XFF039300),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    child: FittedBox(
                      child: Text(
                        'Office',
                        style: TextStyle(fontSize: 11.sp, color: kWhite),
                      ),
                    ),
                  )
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '6282712271',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                  Text(
                    'ERE business solutions, cyberpark, kozhikode, kerala,673636',
                    style: TextStyle(fontSize: 13.sp),
                  )
                ],
              ),
            ),
            dHeight1,

            //==================== Add new Address ====================
            ListTile(
              dense: true,
              leading: Text(
                'Add new Address',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: kBlack,
                  size: 20.sp,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, routeAddAddress);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
