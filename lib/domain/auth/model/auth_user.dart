// To parse this JSON data, do
//
//     final authUser = authUserFromJson(jsonString);
import 'dart:convert';

AuthUser authUserFromJson(String str) => AuthUser.fromJson(json.decode(str));

String authUserToJson(AuthUser data) => json.encode(data.toJson());

class AuthUser {
  AuthUser({
    required this.codigoUsuario,
    required this.nombre,
    required this.codigoProveedor,
    required this.codigoPerfil,
  });

  int codigoUsuario;
  String nombre;
  int codigoProveedor;
  int codigoPerfil;

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        codigoUsuario: json["codigoUsuario"].toInt() ?? 0,
        nombre: json["nombre"] ?? "",
        codigoProveedor: json["codigoProveedor"].toInt() ?? 0,
        codigoPerfil: json["codigoPerfil"].toInt() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "codigoUsuario": codigoUsuario,
        "nombre": nombre,
        "codigoProveedor": codigoProveedor,
        "codigoPerfil": codigoPerfil,
      };
}
