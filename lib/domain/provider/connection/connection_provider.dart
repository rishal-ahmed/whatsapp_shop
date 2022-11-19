import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/connection/connection_event.dart';
import 'package:whatsapp_shop/application/connection/connection_notifier.dart';
import 'package:whatsapp_shop/application/connection/connection_state.dart';

class ConnectionProvider {
  //==--==--==--==--==-- Internet Connection --==--==--==--==--==
  static final connectionProvider =
      StateNotifierProvider.autoDispose<ConnectionNotifier, ConnectionState>(
          (ref) {
    return ConnectionNotifier()..emit(const ConnectionEvent.check());
  });

  //==--==--==--==--==-- Connection Alert --==--==--==--==--==
  static final isOpenProvider = StateProvider<bool>((ref) {
    return false;
  });
}
