import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uma/domain/auth/model/auth_user.dart';

import 'package:uma/infraestructure/services/constants/apis.dart';
import 'package:uma/infraestructure/services/local/session/session_interface.dart';
import 'package:uma/infraestructure/services/local/session/session_service.dart';

class AuthService {
  static final SessionInterface _sessionInterface = SessionService();
  AuthService();
  //https://mercadeo.celuwebdev.com/RIGELSYNCUMA/LogIn.aspx?un=10007176&pw=10007176
  static Future<bool> isValidUser(String user, String password) async {
    final url = Uri.parse('${ApiConstants.userLogin}un=$user&pw=$password');
    final res = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (jsonDecode(res.body)["Usuario"] == null) {
      return false;
    }

    try {
      int codigoUsuario = int.parse(jsonDecode(res.body)["Usuario"]);
      String nombre = jsonDecode(res.body)["Nombre"];
      int codigoProveedor = int.parse(jsonDecode(res.body)["CodProveedor"]);
      int codigoPerfil = int.parse(jsonDecode(res.body)["CodigoPerfil"]);

      final AuthUser authUser = AuthUser(
        codigoUsuario: codigoUsuario,
        nombre: nombre,
        codigoProveedor: codigoProveedor,
        codigoPerfil: codigoPerfil,
      );

      await _sessionInterface.setUser(authUser);
      print(jsonEncode(_sessionInterface.getUser()));
    } catch (error) {
      return false;
    }

    return true;
  }
}
