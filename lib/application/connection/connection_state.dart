import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_state.freezed.dart';

enum NetworkStatus { initial, online, offline }

@freezed
class ConnectionState with _$ConnectionState {
  const factory ConnectionState({
    @Default(NetworkStatus.initial) NetworkStatus status,
  }) = _ConnectionState;
}
