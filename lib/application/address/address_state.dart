import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    required bool isLoading,
    required bool isError,
    required bool status,
  }) = _AddressState;

  factory AddressState.initial() =>
      const AddressState(isLoading: false, isError: false, status: false);
}
