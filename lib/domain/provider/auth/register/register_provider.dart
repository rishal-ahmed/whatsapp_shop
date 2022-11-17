import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/register/register_notifier.dart';
import 'package:whatsapp_shop/application/register/register_state.dart';

class RegisterProvider {
  //==--==--==--==--==-- Register --==--==--==--==--==
  static final registerProvider =
      StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>((ref) {
    return RegisterNotifier();
  });

  //==--==--==--==--==-- Obscure --==--==--==--==--==
  static final obscureProvider = StateProvider.autoDispose<bool>((ref) => true);

  static final obscureConfirmProvider =
      StateProvider.autoDispose<bool>((ref) => true);

  //==--==--==--==--==-- Agree --==--==--==--==--==
  static final agreeProvider = StateProvider.autoDispose<bool>((ref) => false);

  //==--==--==--==--==-- Validate --==--==--==--==--==
  static final validateProvider =
      StateProvider.autoDispose<bool>((ref) => false);
}
