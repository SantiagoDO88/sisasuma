// To parse this JSON data, do
//
//     final seguimientoPlan = seguimientoPlanFromJson(jsonString);

import 'dart:convert';

SeguimientoPlan seguimientoPlanFromJson(String str) =>
    SeguimientoPlan.fromJson(json.decode(str));

String seguimientoPlanToJson(SeguimientoPlan data) =>
    json.encode(data.toJson());

class SeguimientoPlan {
  SeguimientoPlan({
    this.numeroDocumento,
    this.fechaInicio,
    this.puntoDeVenta,
    this.idActividadSeguimientoPlan,
    this.descripcionActividadDropDown,
    this.fechaInicioAccion,
    this.responsablePdv,
    this.fechaCompromisoAccion,
    this.fechaCierre,
    this.idEstadoSeguimientoPlan,
    this.descripcionEstadoActividadDropDown,
    this.descripcionActividad,
    this.email,
    this.codigoCliente,
    this.codigoUsuarioSys,
    this.idFotoPlan,
  });
  String? numeroDocumento;
  String? fechaInicio;
  String? puntoDeVenta;
  String? idActividadSeguimientoPlan;
  String? descripcionActividadDropDown;
  String? fechaInicioAccion;
  String? responsablePdv;
  String? fechaCompromisoAccion;
  String? fechaCierre;
  int? idEstadoSeguimientoPlan;
  String? descripcionEstadoActividadDropDown;
  String? descripcionActividad;
  String? email;
  int? codigoCliente;
  int? codigoUsuarioSys;
  String? idFotoPlan;

  factory SeguimientoPlan.fromJson(Map<String, dynamic> json) =>
      SeguimientoPlan(
        numeroDocumento: json["numeroDocumento"] ?? "",
        fechaInicio: json["fechaInicio"] ?? "",
        puntoDeVenta: json["puntoDeVenta"] ?? "",
        idActividadSeguimientoPlan: json["idActividadSeguimientoPlan"] ?? "",
        descripcionActividadDropDown:
            json["descripcionActividadDropDown"] ?? "",
        fechaInicioAccion: json["fechaInicioAccion"] ?? "",
        responsablePdv: json["responsablePdv"] ?? "",
        fechaCompromisoAccion: json["fechaCompromisoAccion"] ?? "",
        fechaCierre: json["fechaCierre"] ?? "",
        idEstadoSeguimientoPlan: json["idEstadoSeguimientoPlan"] ?? 0,
        descripcionEstadoActividadDropDown:
            json["descripcionEstadoActividadDropDown"] ?? "",
        descripcionActividad: json["descripcionActividad"] ?? "",
        email: json["email"] ?? "",
        codigoCliente: json["codigoCliente"] ?? 0,
        codigoUsuarioSys: json["codigoUsuarioSys"] ?? 0,
        idFotoPlan: json["idFotoPlan"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "numeroDocumento": numeroDocumento,
        "fechaInicio": fechaInicio,
        "puntoDeVenta": puntoDeVenta,
        "idActividadSeguimientoPlan": idActividadSeguimientoPlan,
        "descripcionActividadDropDown": descripcionActividadDropDown,
        "fechaInicioAccion": fechaInicioAccion,
        "responsablePDV": responsablePdv,
        "fechaCompromisoAccion": fechaCompromisoAccion,
        "fechaCierre": fechaCierre,
        "idEstadoSeguimientoPlan": idEstadoSeguimientoPlan,
        "descripcionEstadoActividadDropDown": descripcionEstadoActividadDropDown,
        "descripcionActividad": descripcionActividad,
        "email": email,
        "codigoCliente": codigoCliente,
        "codigoUsuarioSys": codigoUsuarioSys,
        "idFotoPlan": idFotoPlan,
      };
}
