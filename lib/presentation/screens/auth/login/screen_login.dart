import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_shop/application/login/login_event.dart';
import 'package:whatsapp_shop/application/login/login_notifier.dart';
import 'package:whatsapp_shop/application/login/login_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/user/user_model.dart';
import 'package:whatsapp_shop/domain/utils/snackbars/snackbar.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';
import 'package:whatsapp_shop/domain/utils/validators/validators.dart';
import 'package:whatsapp_shop/presentation/screens/auth/register/screen_register.dart';
import 'package:whatsapp_shop/presentation/widgets/buttons/custom_material_button.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/text_field_widget.dart';

final _loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});

class ScreenLogin extends ConsumerWidget {
  ScreenLogin({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: SafeArea(
          child: Container(
            height: double.infinity,
            color: kWhite,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dHeight10,
                      Text.rich(
                        TextSpan(
                            text: 'Welcome to \n',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 19.sp,
                              color: primaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: 'WhatsAppShop ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19.sp,
                                  color: secondaryColor,
                                ),
                              )
                            ]),
                        textAlign: TextAlign.start,
                      ),
                      dHeight1n5,
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: authTextColor,
                        ),
                      ),
                      dHeight7,
                      TextFeildWidget(
                        contentPadding: const EdgeInsets.all(16),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: kColorAuthField)),
                        fillColor: kColorAuthField,
                        controller: usernameController,
                        hintText: 'Enter Email / Mobile Number',
                        validator: (value) => Validators.nullValidator(value),
                      ),
                      dHeight1n5,
                      TextFeildWidget(
                        contentPadding: const EdgeInsets.all(16),
                        suffixIcon: Icon(Icons.visibility, size: 19.sp),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: kColorAuthField)),
                        fillColor: kColorAuthField,
                        controller: passwordController,
                        hintText: 'Enter Password',
                        validator: (value) => Validators.nullValidator(value),
                      ),
                      dHeight3,
                      Consumer(
                        builder: (context, ref, _) {
                          final LoginState state = ref.watch(_loginProvider);

                          if (state.isError) {
                            kSnackBar(
                              context: context,
                              content:
                                  'Something went wrong, please try again later',
                              error: true,
                            );
                          }
                          if (state.user != null) {
                            final UserModel user = state.user!;

                            final String userString =
                                jsonEncode(state.user!.toJson());

                            kSnackBar(
                              context: context,
                              content: 'Logged in successfully',
                              success: true,
                            );

                            WidgetsBinding.instance
                                .addPostFrameCallback((_) async {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  routeMain, ModalRoute.withName(routeRoot));
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('user', userString);
                              UserUtils.instance.saveUser(user: user);
                            });
                          }

                          return CustomMaterialBtton(
                            onPressed: () {
                              // Navigator.pushNamedAndRemoveUntil(
                              //     context, routeMain, (route) => true);

                              final FormState? formState =
                                  _formKey.currentState;
                              if (formState!.validate()) {
                                final String username = usernameController.text;
                                final String password = passwordController.text;

                                ref.read(_loginProvider.notifier).emit(
                                    LoginEvent.login(
                                        username: username,
                                        password: password));
                              }
                            },
                            borderRadius: BorderRadius.circular(10),
                            isLoading: state.isLoading,
                            buttonText: 'Sign in',
                          );
                        },
                      ),
                      dHeight1,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                            color: forgetTextColor,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      dHeight5,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text.rich(
                          TextSpan(
                              text: "Don't Have an Account?  ",
                              style: TextStyle(
                                color: kColorHint,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: "REGISTER",
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenRegister()));
                                    },
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
