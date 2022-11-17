import 'dart:convert';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_shop/application/register/register_event.dart';
import 'package:whatsapp_shop/application/register/register_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/user/user_model.dart';
import 'package:whatsapp_shop/domain/provider/auth/register/register_provider.dart';
import 'package:whatsapp_shop/domain/utils/snackbars/snackbar.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';
import 'package:whatsapp_shop/domain/utils/validators/validators.dart';
import 'package:whatsapp_shop/presentation/screens/auth/login/screen_login.dart';
import 'package:whatsapp_shop/presentation/widgets/buttons/custom_material_button.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/text_field_widget.dart';

class ScreenRegister extends ConsumerWidget {
  ScreenRegister({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
                        'Register Now!',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: authTextColor,
                        ),
                      ),
                      dHeight7,
                      TextFeildWidget(
                        controller: nameController,
                        hintText: 'Name',
                        contentPadding: const EdgeInsets.all(16),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kColorFieldBg)),
                        fillColor: kColorFieldBg,
                        validator: (value) => Validators.nullValidator(value),
                      ),
                      dHeight1n5,
                      TextFeildWidget(
                        controller: mobileController,
                        hintText: 'Mobile',
                        textInputType: TextInputType.phone,
                        inputFormatters: Validators.digitsOnly,
                        contentPadding: const EdgeInsets.all(16),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kColorFieldBg)),
                        fillColor: kColorFieldBg,
                        validator: (value) => Validators.phoneValidator(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      dHeight1n5,
                      TextFeildWidget(
                        controller: emailController,
                        hintText: 'Email ID',
                        textInputType: TextInputType.emailAddress,
                        contentPadding: const EdgeInsets.all(16),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kColorFieldBg)),
                        fillColor: kColorFieldBg,
                        validator: (value) => Validators.emailValidator(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      dHeight1n5,
                      TextFeildWidget(
                        controller: passwordController,
                        hintText: 'Enter Password',
                        contentPadding: const EdgeInsets.all(16),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kColorFieldBg)),
                        fillColor: kColorFieldBg,
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref
                                .read(RegisterProvider.obscureProvider.notifier)
                                .update((state) => !state);
                          },
                          icon: Icon(
                            ref.read(RegisterProvider.obscureProvider)
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 19.sp,
                          ),
                        ),
                        validator: (value) =>
                            Validators.passwordValidator(value),
                        obscureText:
                            ref.watch(RegisterProvider.obscureProvider),
                      ),
                      dHeight1n5,
                      TextFeildWidget(
                        hintText: 'Confirm Password',
                        contentPadding: const EdgeInsets.all(16),
                        inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kColorFieldBg)),
                        fillColor: kColorFieldBg,
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref
                                .read(RegisterProvider
                                    .obscureConfirmProvider.notifier)
                                .update((state) => !state);
                          },
                          icon: Icon(
                            ref.read(RegisterProvider.obscureConfirmProvider)
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 19.sp,
                          ),
                        ),
                        obscureText:
                            ref.watch(RegisterProvider.obscureConfirmProvider),
                        validator: (value) => Validators.confirmValidator(
                            value1: value, value2: passwordController.text),
                      ),
                      dHeight1,
                      Consumer(
                        builder: (context, ref, _) {
                          final bool value =
                              ref.watch(RegisterProvider.agreeProvider);
                          final bool isValid =
                              ref.watch(RegisterProvider.validateProvider);

                          return ListTileTheme(
                            horizontalTitleGap: 0,
                            child: CheckboxListTile(
                              value: value,
                              onChanged: (value) => ref
                                  .read(RegisterProvider.agreeProvider.notifier)
                                  .state = value!,
                              title: Text(
                                'I Agree with Terms and Conditions',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              activeColor: primaryColor,
                              side: BorderSide(
                                color: !value && !isValid
                                    ? const Color(0xff767676)
                                    : kRed,
                              ),
                            ),
                          );
                        },
                      ),
                      dHeight2,
                      Consumer(
                        builder: (context, ref, _) {
                          final RegisterState state =
                              ref.watch(RegisterProvider.registerProvider);

                          ref.listen(
                            RegisterProvider.registerProvider,
                            (previous, next) async {
                              if (state.isError) {
                                return kSnackBar(
                                  context: context,
                                  content: state.errorMessage,
                                  error: true,
                                );
                              }
                              if (state.user != null) {
                                final UserModel user = state.user!;

                                final String userString =
                                    jsonEncode(state.user!.toJson());

                                kSnackBar(
                                  context: context,
                                  content: 'Registered successfully',
                                  success: true,
                                );

                                Navigator.pushNamedAndRemoveUntil(context,
                                    routeHome, ModalRoute.withName(routeRoot));
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('user', userString);
                                UserUtils.instance.saveUser(user: user);
                              }
                            },
                          );

                          return CustomMaterialBtton(
                            onPressed: () {
                              final FormState? formState =
                                  _formKey.currentState;

                              final bool isValid = ref
                                  .read(RegisterProvider
                                      .validateProvider.notifier)
                                  .state = formState!.validate();

                              final bool isAgreed =
                                  ref.read(RegisterProvider.agreeProvider);

                              log('isValid $isValid');
                              log('isAgreed $isAgreed');

                              if (isValid && isAgreed) {
                                final String name = nameController.text;
                                final String mobile = mobileController.text;
                                final String email = emailController.text;
                                final String password = passwordController.text;

                                ref
                                    .read(RegisterProvider
                                        .registerProvider.notifier)
                                    .emit(
                                      RegisterEvent.register(
                                        name: name,
                                        mobile: mobile,
                                        email: email,
                                        password: password,
                                      ),
                                    );
                              }
                            },
                            borderRadius: BorderRadius.circular(10),
                            isLoading: state.isLoading,
                            buttonText: 'Proceed',
                          );
                        },
                      ),
                      dHeight5,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text.rich(
                          TextSpan(
                              text: "Have an Account?  ",
                              style: TextStyle(
                                color: kColorHint,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: "SIGN IN",
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
                                                  ScreenLogin()));
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
