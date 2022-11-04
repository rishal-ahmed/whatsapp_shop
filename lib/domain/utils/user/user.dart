import 'dart:convert';

import 'package:whatsapp_shop/domain/models/user/user_model.dart';

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
  void saveUser({required UserModel user}) {
    userModel = user;
  }
}
