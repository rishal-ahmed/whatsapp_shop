import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({
    super.key,
    required this.value,
    required this.items,
    this.onChanged,
    this.width,
    this.isExpanded = false,
    this.preText = '',
  });

  final dynamic value;
  final List<dynamic> items;
  final Function(dynamic)? onChanged;
  final double? width;
  final bool isExpanded;
  final String preText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField<dynamic>(
        isExpanded: isExpanded,
        isDense: true,
        value: value,
        // style: TextStyle(fontSize: 10.sp),
        decoration: InputDecoration(
          fillColor: kWhite,
          filled: true,
          constraints: const BoxConstraints(
            maxHeight: 20,
            minHeight: 20,
            minWidth: 20,
            maxWidth: 20,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
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
          size: 16.sp,
          color: const Color(0XFF4F4E4E),
        ),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<dynamic>>((dynamic value) {
          return DropdownMenuItem(
            alignment: Alignment.centerLeft,
            value: value,
            child: Text(
              preText + value.toString(),
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0XFF4F4E4E),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
