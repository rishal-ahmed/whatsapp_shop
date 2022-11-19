import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/connection/connection_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/images.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/provider/connection/connection_provider.dart';

class ConnectionWidget extends ConsumerWidget {
  const ConnectionWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connection = ref.watch(ConnectionProvider.connectionProvider);
    final isCurrent = ModalRoute.of(context)?.isCurrent;

    log('Connection status = ${connection.status}');
    log('isCurrent = $isCurrent');

    showConnectionWarning(context, ref,
        status: connection.status, isCurrent: isCurrent);

    switch (connection.status) {
      case NetworkStatus.online:
        return child;

      default:
        return WillPopScope(
          onWillPop: () async {
            final isOpen = ref.read(ConnectionProvider.isOpenProvider.notifier);
            final bool isOnline = ref.read(ConnectionProvider.connectionProvider
                .select((value) => value.status.name == 'online'));
            if (isOnline && isOpen.state) {
              isOpen.state = false;
              return true;
            } else {
              return false;
            }
          },
          child: Scaffold(
            body: Container(
              color: kWhite,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    kImageErrorInternet,
                    width: 45.w,
                    alignment: Alignment.center,
                  ),
                  dHeight2,
                  FittedBox(
                    child: Text(
                      'No Internet Connection',
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 15.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  dHeight05,
                  FittedBox(
                    child: Text(
                      'Please check your internet connection and try again.',
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 14.5.sp,
                      ),
                    ),
                  ),
                  // const SizedBox(height: kToolbarHeight),
                ],
              ),
            ),
          ),
        );
    }
  }

  Future<void> showConnectionWarning(BuildContext context, WidgetRef ref,
      {required Enum status, required bool? isCurrent}) async {
    final isOpen = ref.read(ConnectionProvider.isOpenProvider.notifier);

    if (status != NetworkStatus.online && isCurrent == false) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (!isOpen.state) {
          Navigator.pushNamed(context, routeConnection);
          isOpen.state = true;
        }
      });
      // WidgetsBinding.instance.addPostFrameCallback(
      //   (_) async {
      //     final isOpen = ref.read(ConnectionProvider.isOpenProvider.notifier);
      //     if (!isOpen.state) {
      //       isOpen.state = true;
      //       await showCupertinoDialog(
      //         barrierDismissible: false,
      //         context: context,
      //         builder: (ctx) {
      //           return WillPopScope(
      //             onWillPop: () async {
      //               final bool isOnline = ref.read(ConnectionProvider
      //                   .connectionProvider
      //                   .select((value) => value.status.name == 'online'));
      //               isOpen.state = false;
      //               return isOnline;
      //             },
      //             child: CupertinoAlertDialog(
      //               title: const Text('No Internet Connection'),
      //               content: const Text(
      //                   'Please check your internet connection and try again.'),
      //               actions: [
      //                 TextButton(
      //                     onPressed: () {
      //                       final bool isOnline = ref.read(
      //                           ConnectionProvider.connectionProvider.select(
      //                               (value) => value.status.name == 'online'));
      //                       if (isOnline) {
      //                         isOpen.state = false;
      //                         Navigator.pop(context);
      //                       }
      //                     },
      //                     child: const Text('Okay'))
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     }
      //   },
      // );
    }

    if (status == NetworkStatus.online && isCurrent == false) {
      if (isOpen.state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
          isOpen.state = false;
        });
      }
    }
  }
}
