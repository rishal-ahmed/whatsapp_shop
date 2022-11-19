import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_event.freezed.dart';

@freezed
class ConnectionEvent with _$ConnectionEvent {
  //=-=-=-=-=- Internet Connection Event -=-=-=-=-=
  const factory ConnectionEvent.check() = _ConnectionEventCheck;
}
