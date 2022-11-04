import 'package:uma/domain/auth/interface/auth_interface.dart';

import 'package:uma/infraestructure/services/api/auth_service.dart';

class AuthUserApi implements AuthInterface {
  @override
  Future<bool> isValidUser(String user, String password) async {
    return await AuthService.isValidUser(user, password);
  }
}
