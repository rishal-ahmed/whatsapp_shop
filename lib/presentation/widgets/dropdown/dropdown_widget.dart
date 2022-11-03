import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/domain/models/shop_category/shop_category_model.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget(
      {super.key, required this.value, required this.items, this.onChanged});

  final ShopCategoryModel value;
  final List<ShopCategoryModel> items;
  final Function(ShopCategoryModel?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ShopCategoryModel>(
      isExpanded: true,
      isDense: true,
      value: value,
      decoration: InputDecoration(
        fillColor: kWhite,
        filled: true,
        constraints: const BoxConstraints(
          maxHeight: 30,
          minHeight: 30,
          minWidth: 30,
          maxWidth: 30,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: searchBorderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: searchBorderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: searchBorderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: searchBorderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: searchBorderColor),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      icon: Icon(
        Icons.keyboard_arrow_down,
        size: 18.sp,
        color: const Color(0XFF4F4E4E),
      ),
      onChanged: onChanged,
      items: items
          .map<DropdownMenuItem<ShopCategoryModel>>((ShopCategoryModel value) {
        return DropdownMenuItem(
          alignment: Alignment.centerLeft,
          value: value,
          child: Text(
            value.name,
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0XFF4F4E4E),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }
}
