// To parse this JSON data, do
//
//     final startDay = startDayFromJson(jsonString);

import 'dart:convert';

StartDay startDayFromJson(String str) => StartDay.fromJson(json.decode(str));

String startDayToJson(StartDay data) => json.encode(data.toJson());

class StartDay {
    StartDay({
        this.codigoUsuario,
        this.fecha,
        this.imei,
        this.version,
        this.fechaFinMovil,
        this.codigoProveedor,
        this.fechaCons,
        this.kmInicial,
        this.kmFinal,
        this.idFotoKm,
    });

    String? codigoUsuario;
    String? fecha;
    String? imei;
    String? version;
    String? fechaFinMovil;
    int? codigoProveedor;
    int? fechaCons;
    int? kmInicial;
    int? kmFinal;
    int? idFotoKm;

    factory StartDay.fromJson(Map<String, dynamic> json) => StartDay(
        codigoUsuario: json["codigoUsuario"] ?? null,
        fecha: json["fecha"] == null ? null : json["fecha"],
        imei: json["imei"] == null ? null : json["imei"],
        version: json["version"] == null ? null : json["version"],
        fechaFinMovil: json["fechaFinMovil"] == null ? null : json["fechaFinMovil"],
        codigoProveedor: json["codigoProveedor"] == null ? null : json["codigoProveedor"],
        fechaCons: json["fechaCons"] == null ? null : json["fechaCons"],
        kmInicial: json["kmInicial"] == null ? null : json["kmInicial"],
        kmFinal: json["kmFinal"] == null ? null : json["kmFinal"],
        idFotoKm: json["idFotoKm"] == null ? null : json["idFotoKm"],
    );

    Map<String, dynamic> toJson() => {
        "codigoUsuario": codigoUsuario == null ? null : codigoUsuario,
        "fecha": fecha == null ? null : fecha,
        "imei": imei == null ? null : imei,
        "version": version == null ? null : version,
        "fechaFinMovil": fechaFinMovil == null ? null : fechaFinMovil,
        "codigoProveedor": codigoProveedor == null ? null : codigoProveedor,
        "fechaCons": fechaCons == null ? null : fechaCons,
        "kmInicial": kmInicial == null ? null : kmInicial,
        "kmFinal": kmFinal == null ? null : kmFinal,
        "idFotoKm": idFotoKm == null ? null : idFotoKm,
    };
}
