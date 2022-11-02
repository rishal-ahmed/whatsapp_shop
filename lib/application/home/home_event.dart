import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  //=-=-=-=-=- Login Event -=-=-=-=-=
  const factory HomeEvent.home() = _HomeEvent;
}
