import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/screens/product_pages/screen_productlisting.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/text_field_widget.dart';

class ScreenPersonalInformation extends StatefulWidget {
  const ScreenPersonalInformation({super.key});

  @override
  State<ScreenPersonalInformation> createState() =>
      _ScreenPersonalInformationState();
}

class _ScreenPersonalInformationState extends State<ScreenPersonalInformation> {
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();

  final int hi = 0;

  @override
  Widget build(BuildContext context) {
    log('build() -> called');
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize(context).getSize.width * 0.08,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 54),
                child: Column(
                  children: [
                    Container(
                      height: 91,
                      width: 91,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primaryColor,
                      ),
                    ),
                    kHeight10,
                    const Text(
                      'Personal informations',
                      style: TextStyle(color: textColor, fontSize: 12),
                    ),
                  ],
                ),
              ),
              kHeight40,
              SizedBox(
                height: 40,
                child: TextFeildWidget(
                  textInputType: TextInputType.name,
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
                  inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kColorHint,
                      )),
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
                height: 40,
                child: TextFeildWidget(
                  textInputType: TextInputType.number,
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
                  inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kColorHint,
                      )),
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
                height: 40,
                child: TextFeildWidget(
                  textInputType: TextInputType.emailAddress,
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 18),
                  inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kColorHint,
                      )),
                  controller: email,
                  hintText: 'Email ID',
                  hintStyle: const TextStyle(
                    color: kColorHint,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              kHeight40,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenProductListing()));
                },
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryTextColor),
                    child: const Center(
                      child: Text(
                        'SAVE CHANGES',
                        style: TextStyle(
                          color: buttonTextColor,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              kHeight40
            ],
          ),
        ),
      )),
    );
  }
}
