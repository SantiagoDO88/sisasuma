// To parse this JSON data, do
//
//     final modelo = modeloFromMap(jsonString);

import 'dart:convert';

class Modelo {
    Modelo({
        this.codigoMedicion,
        this.descripcion,
        this.codigoMarcaMedicion,
    });

    int? codigoMedicion;
    String? descripcion;
    String? codigoMarcaMedicion;

    factory Modelo.fromJson(String str) => Modelo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Modelo.fromMap(Map<String, dynamic> json) => Modelo(
        codigoMedicion: json["CodigoMedicion"],
        descripcion: json["Descripcion"],
        codigoMarcaMedicion: json["codigomarcamedicion"],
    );

    Map<String, dynamic> toMap() => {
        "CodigoMedicion": codigoMedicion,
        "Descripcion": descripcion,
        "codigomarcamedicion": codigoMarcaMedicion,
    };
}

// {
// "CodigoMedicion":1,
// "Descripcion":"",
// "codigomarcamedicion":""
// }