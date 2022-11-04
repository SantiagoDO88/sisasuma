// To parse this JSON data, do
//
//     final rutero = ruteroFromJson(jsonString);

import 'dart:convert';

Rutero ruteroFromJson(String str) => Rutero.fromJson(json.decode(str));

String ruteroToJson(Rutero data) => json.encode(data.toJson());

class Rutero {
    Rutero({
        this.codigoCliente,
        this.codigoDia,
        this.orden,
        this.frecuencia,
        this.nombreRuta,
        this.codigoProveedor,
    });

    String? codigoCliente;
    int? codigoDia;
    String? orden;
    String? frecuencia;
    String? nombreRuta;
    int? codigoProveedor;

    factory Rutero.fromJson(Map<String, dynamic> json) => Rutero(
        codigoCliente: json["CodigoCliente"],
        codigoDia: json["CodigoDia"],
        orden: json["orden"],
        frecuencia: json["Frecuencia"],
        nombreRuta: json["NombreRuta"],
        codigoProveedor: json["CodigoProveedor"],
    );

    Map<String, dynamic> toJson() => {
        "CodigoCliente": codigoCliente,
        "CodigoDia": codigoDia,
        "orden": orden,
        "Frecuencia": frecuencia,
        "NombreRuta": nombreRuta,
        "CodigoProveedor": codigoProveedor,
    };
}