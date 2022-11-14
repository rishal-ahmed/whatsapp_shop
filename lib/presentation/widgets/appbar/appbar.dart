import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/cart/cart_event.dart';
import 'package:whatsapp_shop/application/cart/cart_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/images.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/provider/cart/cart_provider.dart';
import 'package:whatsapp_shop/domain/utils/snackbars/snackbar.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';
import 'package:whatsapp_shop/presentation/widgets/dialogs/alert_dialog_custom.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.elevation,
    this.backgroundColor = primaryColor,
    this.bottom,
    this.defualt = false,
    this.isDrawer = false,
    this.centerTitle = true,
    this.cartTap = true,
  }) : super(key: key);
  final String? title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final bool defualt;
  final bool isDrawer;
  final bool cartTap;

  @override
  Widget build(BuildContext context) {
    return defualt
        ? AppBar(
            backgroundColor: backgroundColor,
            elevation: elevation,
            leading: isDrawer
                ? Builder(
                    builder: (context) => IconButton(
                      icon: SvgPicture.asset(kIconDrawer,
                          color: const Color(0XFF8D9BA3)),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  )
                : IconButton(
                    alignment: Alignment.center,
                    onPressed: () => Navigator.pop(context),
                    splashColor: kTransparentColor,
                    highlightColor: kTransparentColor,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: Color(0XFF8D9BA3),
                    ),
                  ),
            title: title != null
                ? Text(
                    title!,
                    style: TextStyle(fontSize: 16.sp),
                  )
                : defaultTitle,
            centerTitle: centerTitle,
            bottom: bottom,
            actions: [
              if (!cartTap)
                Consumer(
                  builder: (context, ref, _) {
                    ref.listen(
                      CartProvider.cartClearProvider,
                      (previous, next) {
                        if (!next.isLoading && next.status) {
                          kSnackBar(
                            context: context,
                            content: 'Cart cleared successfully',
                            success: true,
                          );
                          ref.invalidate(CartProvider.cartsProvider);
                          ref.invalidate(CartProvider.cartSumProvider);
                          ref.invalidate(CartProvider.cartCountProvider);
                        }

                        if (!next.isLoading && next.isError) {
                          return kSnackBar(
                            context: context,
                            content: 'Something went wrong',
                            error: true,
                          );
                        }
                      },
                    );
                    return IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => KAlertDialog(
                            title: Text(
                              'Clear Cart',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: primaryTextColor,
                              ),
                            ),
                            content: Text(
                              'Are you sure you want to clear all carts?',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: primaryTextColor,
                              ),
                            ),
                            submitText: 'Clear',
                            submitAction: () async {
                              Navigator.pop(ctx);
                              ref
                                  .read(CartProvider.cartClearProvider.notifier)
                                  .emit(CartEvent.cartClear(
                                      userId:
                                          UserUtils.instance.userModel!.id));
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.clear_all,
                        color: Color(0XFF8D9BA3),
                      ),
                    );
                  },
                ),
              Center(
                child: IconButton(
                  icon: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(kIconCart),
                      ),
                      Consumer(
                        builder: (context, ref, _) {
                          final CartState state =
                              ref.watch(CartProvider.cartCountProvider);
                          if (state.isError ||
                              state.isLoading ||
                              state.count == null ||
                              state.count == 0) return kNone;
                          return Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: const Color(0XFF01A783),
                              child: FittedBox(
                                child: Text(
                                  state.count.toString(),
                                  style:
                                      const TextStyle(color: Color(0XFF1F2C34)),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  onPressed: !cartTap
                      ? null
                      : () {
                          Navigator.pushNamed(context, routeCart);
                        },
                ),
              )
            ],
          )
        : AppBar(
            backgroundColor: backgroundColor,
            elevation: elevation,
            leading: leading ??
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () => Navigator.pop(context),
                  splashColor: kTransparentColor,
                  highlightColor: kTransparentColor,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Color(0XFF8D9BA3),
                  ),
                ),
            title: title != null
                ? Text(title!, style: TextStyle(fontSize: 16.sp))
                : null,
            bottom: bottom,
            actions: actions,
          );
  }

  Widget get defaultTitle => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            kIconLogo,
            height: 26,
            width: 26,
          ),
          dWidth2,
          Text(
            'WhatsAppShop',
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
        ],
      );

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
