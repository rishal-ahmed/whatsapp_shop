import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/connection/connection_event.dart';
import 'package:whatsapp_shop/application/connection/connection_state.dart';

class ConnectionNotifier extends StateNotifier<ConnectionState> {
  StreamController<ConnectivityResult> controller = StreamController();

  final ConnectionState connectionState = const ConnectionState();

  ConnectionNotifier() : super(const ConnectionState());

  void emit(ConnectionEvent event) {
    event.map(
      //=-=-=-=-=-=-=-=-=-=- Internet Connection Event -=-=-=-=-=-=-=-=-=-=
      check: (check) {
        Connectivity().onConnectivityChanged.listen(
          (event) {
            controller.add(event);
            switch (event) {
              case ConnectivityResult.mobile:
                state = connectionState.copyWith(status: NetworkStatus.online);
                return;
              case ConnectivityResult.wifi:
                state = connectionState.copyWith(status: NetworkStatus.online);
                return;
              default:
                state = connectionState.copyWith(status: NetworkStatus.offline);
                break;
            }
          },
        );
      },
    );
  }
}
