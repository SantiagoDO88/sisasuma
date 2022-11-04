import 'package:uma/domain/auth/model/auth_user.dart';
import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';

abstract class SessionInterface {
  
  AuthUser getUser();
  Future<void> setUser(AuthUser user);
  Future<void> deleteAll();
  Future<bool> thereIsAnUser();
  Future<void> setRutero(RuteroWithCliente rutero);
  RuteroWithCliente getRutero();
}