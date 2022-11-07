import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category_event.freezed.dart';

@freezed
class ProductCategoryEvent with _$ProductCategoryEvent {
  const factory ProductCategoryEvent.categories({required int shopId}) =
      _ProductCategoryEvent;
}
