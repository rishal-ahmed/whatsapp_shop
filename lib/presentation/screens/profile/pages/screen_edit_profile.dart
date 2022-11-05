import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/user/user_model.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';
import 'package:whatsapp_shop/presentation/screens/main/widgets/main_drawer.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';
import 'package:whatsapp_shop/presentation/widgets/buttons/custom_material_button.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/text_field_widget.dart';

class ScreenEditProfile extends StatelessWidget {
  const ScreenEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserUtils.instance.userModel!;
    final TextEditingController nameController =
        TextEditingController(text: user.name);
    final TextEditingController mobileController =
        TextEditingController(text: user.phone);
    final TextEditingController emailIdController =
        TextEditingController(text: user.email);
    return Scaffold(
      appBar: const AppBarWidget(defualt: true),
      drawer: const MainDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              dHeight10,
              Container(
                width: 25.w,
                height: 25.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: primaryColor,
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              dHeight1,
              Text(
                'Personal Information',
                style: TextStyle(
                  color: const Color(0XFF1F2C34),
                  fontSize: 15.sp,
                ),
              ),
              dHeight5,

              //==================== User Details Field ====================
              TextFeildWidget(
                controller: nameController,
                labelText: 'Name',
                isDense: true,
                inputBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0XFFD6D6D6)),
                    borderRadius: BorderRadius.circular(10)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              dHeight2,
              TextFeildWidget(
                controller: mobileController,
                labelText: 'Mobile',
                isDense: true,
                inputBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0XFFD6D6D6)),
                    borderRadius: BorderRadius.circular(10)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              dHeight2,
              TextFeildWidget(
                controller: emailIdController,
                labelText: 'Email ID',
                isDense: true,
                inputBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0XFFD6D6D6)),
                    borderRadius: BorderRadius.circular(10)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              dHeight4,
              CustomMaterialBtton(
                onPressed: () {},
                height: 45,
                buttonText: 'SAVE CHANGES',
                borderRadius: BorderRadius.circular(10),
                color: secondaryColor,
                borderColor: secondaryColor,
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
