import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'uniqueid') required String uniqueId,
    @JsonKey(name: 'shopid') required int shopId,
    @JsonKey(name: 'productid') required int productId,
    @JsonKey(name: 'unitid') required int unitId,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'shopname') required String shopName,
    @JsonKey(name: 'productname') required String productName,
    @JsonKey(name: 'unitname') required String unitName,
    @JsonKey(name: 'unitprice') required int unitPrice,
    @JsonKey(name: 'unitofferprice') required int unitOfferPrice,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
