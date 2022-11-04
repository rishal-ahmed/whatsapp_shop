import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/text_field_widget.dart';

class ScreenSearch extends ConsumerWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        child: Column(
          children: [
            //========== Search Field ==========
            TextFeildWidget(
              inputBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: searchBorderColor)),
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              suffixIcon: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: searchBorderColor,
                ),
                child: const Icon(
                  Icons.search,
                  color: Color(0XFF1F2C34),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 30,
                minHeight: 30,
                minWidth: 30,
                maxWidth: 30,
              ),
              hintText: 'Search Products, Category and More',
              fontSize: 12,
            ),
            dHeight1,
            const Text('Showing search result for "Chair"')
          ],
        ),
      ),
    );
  }
}
