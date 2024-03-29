import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/address/address_event.dart';
import 'package:whatsapp_shop/application/address/address_state.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/models/address/address_model.dart';
import 'package:whatsapp_shop/domain/provider/address/address_provider.dart';
import 'package:whatsapp_shop/domain/utils/snackbars/snackbar.dart';
import 'package:whatsapp_shop/domain/utils/user/user.dart';
import 'package:whatsapp_shop/domain/utils/validators/validators.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';
import 'package:whatsapp_shop/presentation/widgets/buttons/custom_material_button.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/text_field_widget.dart';

class ScreenAddAddress extends ConsumerWidget {
  const ScreenAddAddress({this.addressModel, super.key});

  final AddressModel? addressModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController nameController =
        TextEditingController(text: addressModel?.name);
    final TextEditingController phoneController =
        TextEditingController(text: addressModel?.mobile);
    final TextEditingController mailController =
        TextEditingController(text: addressModel?.email);
    final TextEditingController addressController =
        TextEditingController(text: addressModel?.address);
    final TextEditingController landmarkController =
        TextEditingController(text: addressModel?.landmark);
    final TextEditingController pincodeController =
        TextEditingController(text: addressModel?.pincode);
    final TextEditingController cityController =
        TextEditingController(text: addressModel?.city);
    final TextEditingController districtController =
        TextEditingController(text: addressModel?.district);
    final TextEditingController stateController =
        TextEditingController(text: addressModel?.state);

    if (addressModel != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(AddressProvider.selectedTypeProvider.notifier).state =
            addressModel!.type;
      });
    }

    ref.listen(
      AddressProvider.addAddressProvider,
      (previous, next) {
        if (!next.isLoading && next.status) {
          kSnackBar(
            context: context,
            content: 'Address added successfully',
            success: true,
          );

          Navigator.pop(context, true);
        }

        if (!next.isLoading && next.isError) {
          kSnackBar(
            context: context,
            content: 'Something went wrong',
            error: true,
          );
        }
      },
    );

    ref.listen(
      AddressProvider.updateAddressProvider,
      (previous, next) {
        if (!next.isLoading && next.status) {
          kSnackBar(
            context: context,
            content: 'Address updated successfully',
            success: true,
          );

          Navigator.pop(context, true);
        }

        if (!next.isLoading && next.isError) {
          kSnackBar(
            context: context,
            content: 'Something went wrong',
            error: true,
          );
        }
      },
    );
    return Scaffold(
      appBar: AppBarWidget(
        title: addressModel == null ? 'Add New Address' : 'Edit Address',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dHeight2,
                TextFeildWidget(
                  contentPadding: const EdgeInsets.all(16),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kColorBorder2),
                  ),
                  fillColor: kWhite,
                  hintText: 'Enter your name',
                  validator: (value) => Validators.nullValidator(value),
                  controller: nameController,
                ),
                dHeight1,
                TextFeildWidget(
                  contentPadding: const EdgeInsets.all(16),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kColorBorder2),
                  ),
                  fillColor: kWhite,
                  hintText: 'Enter your phone number',
                  validator: (value) => Validators.phoneValidator(value),
                  controller: phoneController,
                ),
                dHeight1,
                TextFeildWidget(
                  contentPadding: const EdgeInsets.all(16),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kColorBorder2),
                  ),
                  fillColor: kWhite,
                  hintText: 'Enter your mail',
                  validator: (value) => Validators.emailValidator(value),
                  controller: mailController,
                ),
                dHeight1,
                TextFeildWidget(
                  contentPadding: const EdgeInsets.all(16),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kColorBorder2),
                  ),
                  fillColor: kWhite,
                  hintText: 'Enter your address',
                  maxLines: 5,
                  validator: (value) => Validators.nullValidator(value),
                  controller: addressController,
                ),
                dHeight1,
                TextFeildWidget(
                  contentPadding: const EdgeInsets.all(16),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kColorBorder2),
                  ),
                  fillColor: kWhite,
                  hintText: 'Enter your landmark',
                  validator: (value) => Validators.nullValidator(value),
                  controller: landmarkController,
                ),
                dHeight1,
                TextFeildWidget(
                  contentPadding: const EdgeInsets.all(16),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kColorBorder2),
                  ),
                  fillColor: kWhite,
                  hintText: 'Enter your pincode',
                  validator: (value) => Validators.nullValidator(value),
                  controller: pincodeController,
                ),
                dHeight1,
                TextFeildWidget(
                  contentPadding: const EdgeInsets.all(16),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kColorBorder2),
                  ),
                  fillColor: kWhite,
                  hintText: 'Enter your city',
                  validator: (value) => Validators.nullValidator(value),
                  controller: cityController,
                ),
                dHeight1,
                TextFeildWidget(
                  contentPadding: const EdgeInsets.all(16),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kColorBorder2),
                  ),
                  fillColor: kWhite,
                  hintText: 'Enter your district',
                  validator: (value) => Validators.nullValidator(value),
                  controller: districtController,
                ),
                dHeight1,
                TextFeildWidget(
                  contentPadding: const EdgeInsets.all(16),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kColorBorder2),
                  ),
                  fillColor: kWhite,
                  hintText: 'Enter your state',
                  validator: (value) => Validators.nullValidator(value),
                  controller: stateController,
                ),
                dHeight2,

                //==================== Address Type ====================
                Text(
                  'Address type',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: primaryTextColor,
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: .7,
                  child: Consumer(
                    builder: (context, ref, _) {
                      final String selectedType =
                          ref.watch(AddressProvider.selectedTypeProvider);
                      return ListTileTheme(
                        horizontalTitleGap: 0,
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                value: 'Home',
                                groupValue: selectedType,
                                onChanged: (value) {
                                  final selcted = ref.read(AddressProvider
                                      .selectedTypeProvider.notifier);
                                  if (selcted.state != value) {
                                    selcted.state = value!;
                                  }
                                },
                                activeColor: secondaryColor,
                                dense: true,
                                title: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 14.sp),
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                value: 'Work',
                                groupValue: selectedType,
                                onChanged: (value) {
                                  final selcted = ref.read(AddressProvider
                                      .selectedTypeProvider.notifier);
                                  if (selcted.state != value) {
                                    selcted.state = value!;
                                  }
                                },
                                activeColor: secondaryColor,
                                dense: true,
                                title: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Work',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 14.sp),
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                dHeight1,

                //==================== Save Button ====================
                Consumer(
                  builder: (context, ref, _) {
                    final AddressState addressState = addressModel == null
                        ? ref.watch(AddressProvider.addAddressProvider)
                        : ref.watch(AddressProvider.updateAddressProvider);

                    return CustomMaterialBtton(
                      buttonText: 'Save',
                      isLoading: addressState.isLoading,
                      color: primaryColor,
                      borderColor: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                      onPressed: () {
                        final FormState form = formKey.currentState!;

                        if (form.validate()) {
                          final String type =
                              ref.read(AddressProvider.selectedTypeProvider);
                          final AddressModel address = AddressModel(
                            id: addressModel != null ? addressModel!.id : 0,
                            customerId: UserUtils.instance.userId,
                            name: nameController.text,
                            email: mailController.text,
                            mobile: phoneController.text,
                            address: addressController.text,
                            landmark: landmarkController.text,
                            pincode: pincodeController.text,
                            city: cityController.text,
                            district: districtController.text,
                            state: stateController.text,
                            type: type,
                            defaultAddress: "0",
                          );

                          log('addressModel == $address');

                          if (addressModel == null) {
                            ref
                                .read(
                                    AddressProvider.addAddressProvider.notifier)
                                .emit(AddressEvent.addAddress(
                                    addressModel: address));
                          } else {
                            ref
                                .read(AddressProvider
                                    .updateAddressProvider.notifier)
                                .emit(AddressEvent.updateAddress(
                                    addressModel: address));
                          }
                        }
                      },
                    );
                  },
                ),

                dHeight2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
