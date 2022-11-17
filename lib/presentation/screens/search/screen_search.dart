import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/search_products/search_products_event.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/domain/utils/debouncer/debouncer.dart';
import 'package:whatsapp_shop/infrastructure/search/search_provider.dart';
import 'package:whatsapp_shop/presentation/screens/search/widgets/search_product_item_widget.dart';
import 'package:whatsapp_shop/presentation/widgets/errors/errors.dart';
import 'package:whatsapp_shop/presentation/widgets/text_fields/text_field_widget.dart';

class ScreenSearch extends ConsumerWidget {
  const ScreenSearch({required this.shopId, super.key});

  final int shopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //==================== Search Field ====================
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
              onChanged: (query) {
                if (query != null && query.isEmpty || query!.startsWith(' ')) {
                  return Debouncer.timer?.cancel();
                }

                final Debouncer debouncer = Debouncer();

                debouncer.run(() {
                  ref.read(SearchProvider.searchProductProvider.notifier).emit(
                        SearchProductsEvent.search(
                            shopId: shopId, keyword: query),
                      );

                  ref.read(SearchProvider.searchQueryProvider.notifier).state =
                      query;
                });
              },
            ),
            dHeight1,
            Consumer(
              builder: (context, ref, _) {
                final String? query =
                    ref.watch(SearchProvider.searchQueryProvider);

                if (query == null || query.isEmpty) return kNone;

                return Text(
                  'Showing search result for "$query"',
                  style: TextStyle(
                    color: const Color(0xffB6B6B6),
                    fontWeight: FontWeight.w300,
                    fontSize: 13.sp,
                  ),
                );
              },
            ),
            dHeight3,

            //==================== Search Result Field ====================
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final state = ref.watch(SearchProvider.searchProductProvider);
                  final String? query =
                      ref.read(SearchProvider.searchQueryProvider);

                  if (state.isError) {
                    return const SomethingWentWrongWidget();
                  }

                  if (!state.isLoading &&
                      state.products.isEmpty &&
                      (query != null && query.isNotEmpty)) {
                    return const Center(
                        child: Text(
                      'No results found!',
                      style: TextStyle(color: primaryTextColor),
                    ));
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 2.w,
                      mainAxisSpacing: 2.w,
                    ),
                    itemCount: state.isLoading ? 18 : state.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map product = {};
                      if (!state.isLoading) {
                        product = state.products[index];
                      }
                      return SearchProductItemWidget(
                        product: product,
                        shimmer: state.isLoading,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
