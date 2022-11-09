import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'uniqueid') required int uniqueId,
    @JsonKey(name: 'shopid') required int shopId,
    @JsonKey(name: 'productid') required int productId,
    @JsonKey(name: 'unitid') required int unitId,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'shopname') required String shopName,
    @JsonKey(name: 'productname') required String productName,
    @JsonKey(name: 'unitname') required String unitName,
    @JsonKey(name: 'unitprice') required String unitPrice,
    @JsonKey(name: 'unitofferprice') required String unitOfferPrice,
  }) = _CartModel;
}
