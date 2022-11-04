import 'package:uma/domain/auth/interface/auth_interface.dart';

class AuthUserService {
  final AuthInterface authUserInterface;

  AuthUserService({required this.authUserInterface});

  Future<bool> isValidUser(String user, String password) async {
    return await authUserInterface.isValidUser(user, password);
  }
}
