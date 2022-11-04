abstract class AuthInterface {
  Future<bool> isValidUser(String user, String password);
}
