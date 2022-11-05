import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/user/user_model.dart';
import 'package:whatsapp_shop/domain/utils/snackbars/snackbar.dart';
import 'package:whatsapp_shop/presentation/widgets/dialogs/alert_dialog_custom.dart';

class UserUtils {
  //========== Singleton Instance ==========
  UserUtils._();
  static final UserUtils instance = UserUtils._();
  factory UserUtils() {
    return instance;
  }

  //========== Model Classes ==========
  UserModel? userModel;

  //========== Save User on Startup ==========
  void saveUserFromString({required String userString}) {
    final UserModel user = UserModel.fromJson(jsonDecode(userString));
    userModel = user;
  }

  //========== Save User on Login ==========
  void saveUser({required UserModel user}) async {
    userModel = user;
  }

  //========== Logout User ==========
  Future<void> logoutUser(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return KAlertDialog(
          title: Text(
            'Logout',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: primaryTextColor,
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: TextStyle(
              fontSize: 15.sp,
              color: primaryTextColor,
            ),
          ),
          submitText: 'Logout',
          submitAction: () async {
            Navigator.pushNamedAndRemoveUntil(
                context, routeLogin, ModalRoute.withName(routeRoot));
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.remove('user');

            kSnackBar(
              context: context,
              content: 'Logged out successfully',
              success: true,
            );
          },
        );
      },
    );
  }
}
