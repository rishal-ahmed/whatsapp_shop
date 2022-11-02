import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/shop_category/shop_category_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required bool isLoading,
    required bool isError,
    @Default([]) List<ShopCategoryModel>? shopCategories,
  }) = _HomeState;
  const HomeState._();

  factory HomeState.initial() => HomeState(isLoading: false, isError: false);
}
