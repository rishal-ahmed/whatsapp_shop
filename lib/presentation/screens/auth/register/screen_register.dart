import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/presentation/screens/main/screen_main.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/text_field_widget.dart';

import '../../../../core/constants/sizes.dart';

class ScreenRegister extends StatelessWidget {
  ScreenRegister({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController epassword = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  bool checkedValue = false;
  bool newValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize(context).getSize.width * 0.08,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenSize(context).getSize.height * 0.15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome to ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    'WhatsAppShop ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: secondaryTextColor,
                    ),
                  ),
                  kHeight10,
                  Text(
                    'Register Now!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: authTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 53,
              ),
              SizedBox(
                height: 45,
                child: TextFeildWidget(
                  textInputType: TextInputType.name,
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
                  inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kColorAuthField,
                      )),
                  fillColor: kColorAuthField,
                  controller: name,
                  hintText: 'Name',
                  hintStyle: const TextStyle(
                    color: kColorHint,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              kHeight15,
              SizedBox(
                height: 45,
                child: TextFeildWidget(
                  textInputType: TextInputType.number,
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
                  inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kColorAuthField,
                      )),
                  fillColor: kColorAuthField,
                  controller: mobile,
                  hintText: 'Mobile',
                  hintStyle: const TextStyle(
                    color: kColorHint,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              kHeight15,
              SizedBox(
                height: 45,
                child: TextFeildWidget(
                  textInputType: TextInputType.emailAddress,
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
                  inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kColorAuthField,
                      )),
                  fillColor: kColorAuthField,
                  controller: email,
                  hintText: 'Email ID',
                  hintStyle: const TextStyle(
                    color: kColorHint,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              kHeight15,
              SizedBox(
                height: 45,
                child: TextFeildWidget(
                  textInputType: TextInputType.visiblePassword,
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
                  inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kColorAuthField,
                      )),
                  fillColor: kColorAuthField,
                  controller: epassword,
                  hintText: 'Enter Password',
                  hintStyle: const TextStyle(
                    color: kColorHint,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              kHeight15,
              SizedBox(
                height: 45,
                child: TextFeildWidget(
                  textInputType: TextInputType.visiblePassword,
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: kWhite,
                    ),
                  ),
                  fillColor: kColorAuthField,
                  controller: cpassword,
                  hintText: 'Confirm Password',
                  hintStyle: const TextStyle(
                    color: kColorHint,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTileTheme(
                horizontalTitleGap: 0,
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  checkColor: kWhite,
                  activeColor: primaryColor,
                  dense: true,
                  title: const Text(
                    "I Agree with Terms and Conditions",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                  value: checkedValue,
                  onChanged: (newValue) {},
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ),
              kHeight15,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenMain()));
                },
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor),
                    child: const Center(
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                          color: buttonTextColor,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              kHeight15,
              SizedBox(
                height: ScreenSize(context).getSize.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Have an Account ?",
                      style: TextStyle(
                        color: kColorHint,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  kWidth5,
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              kHeight40
            ],
          ),
        ),
      ),
    );
  }
}
