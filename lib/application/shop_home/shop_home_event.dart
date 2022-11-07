import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_home_event.freezed.dart';

@freezed
class ShopHomeEvent with _$ShopHomeEvent {
  const factory ShopHomeEvent.shopHome({required int shopId}) = _ShopHomeEvent;
}
