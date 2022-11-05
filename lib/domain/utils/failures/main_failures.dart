import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_failures.freezed.dart';

@freezed
class MainFailures with _$MainFailures {
  const factory MainFailures.clientFailure({
    @Default('Something went wrong, please try again later') String error,
  }) = _ClientFailure;
  const factory MainFailures.serverFailure({
    @Default('Something went wrong, please try again later') String error,
  }) = _ServerFailure;
}
