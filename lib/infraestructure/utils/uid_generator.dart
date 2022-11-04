import 'package:intl/intl.dart';
import 'package:uma/infraestructure/services/local/session/session_interface.dart';
import 'package:uma/infraestructure/services/local/session/session_service.dart';

class UidGenerator {
  static final SessionInterface _sessionInterface = SessionService();
  static int fotoUid() {
    final String userId = _sessionInterface.getUser().codigoUsuario.toString();
    final String date = DateFormat("yyyyMMdd").format(DateTime.now());

    return int.parse(userId + date);
  }
}
