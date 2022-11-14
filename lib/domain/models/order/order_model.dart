import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'shopid') required int shopId,
    @JsonKey(name: 'customerid') required int customerId,
    @JsonKey(name: 'addressid') required int addressId,
    @JsonKey(name: 'deliveryboy') required int deliveryBoy,
    @JsonKey(name: 'amount') required double amount,
    @JsonKey(name: 'paytype') required String paymentType,
    @JsonKey(name: 'paystatus') required String paymentStatus,
    @JsonKey(name: 'adminstatus') required String adminStatus,
    @JsonKey(name: 'customer_status') required String customerStatus,
    @JsonKey(name: 'txnid') required String txnId,
    @JsonKey(name: 'details') required String details,
    @JsonKey(name: 'promocode') required String promocode,
    @JsonKey(name: 'discount') required double discount,
    @JsonKey(name: 'deliverycharge') required double deliveryCharge,
    @JsonKey(name: 'order_on') required String orderDate,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
