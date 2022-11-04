import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:uma/domain/auth/model/auth_user.dart';
import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/seguimiento_plan.dart';
import 'package:uma/infraestructure/services/local/session/session_interface.dart';

class SessionService implements SessionInterface {
  final _storage = GetStorage();

  @override
  AuthUser getUser() {
    var json = _storage.read('user');
    return authUserFromJson(jsonEncode(json));
  }

  @override
  Future<void> setUser(AuthUser user) async {
    _storage.write('user', user.toJson());
  }

  @override
  Future<void> deleteAll() async {
    _storage.erase();
  }

  @override
  Future<bool> thereIsAnUser() async {
    return _storage.read('user') != null;
  }

  @override
  Future<void> setRutero(RuteroWithCliente rutero) async {
    _storage.write('rutero', rutero.toJson());
  }

  @override
  RuteroWithCliente getRutero() {
    var json = _storage.read('rutero');
    return ruteroWithClienteFromJson(jsonEncode(json));
  }
}
