// To parse this JSON data, do
//
//     final medicionPrecio = medicionPrecioFromMap(jsonString);

import 'dart:convert';

class MedicionPrecio {
    MedicionPrecio({
        this.codigo,
        this.descripcion,
        this.descripcionMarca,
        this.codigoMedicion,
        this.codigomarcamedicion,
        this.numDoc,
        this.codMarcaMedicion,
        this.idModeloMedicion,
        this.precio,
        this.codigoUsuarioSys,
        this.fechaMovil,
        this.fechaServidor,
        this.codigoProveedor,
    });

    String? codigo;
    String? descripcion;
    String? descripcionMarca;
    int? codigoMedicion;
    String? codigomarcamedicion;
    String? numDoc;
    String? codMarcaMedicion;
    int? idModeloMedicion;
    double? precio;
    String? codigoUsuarioSys;
    String? fechaMovil;
    String? fechaServidor;
    int? codigoProveedor;

    factory MedicionPrecio.fromJson(String str) => MedicionPrecio.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MedicionPrecio.fromMap(Map<String, dynamic> json) => MedicionPrecio(
        codigo: json["Codigo"],
        descripcion: json["Descripcion"],
        descripcionMarca: json["DescripcionMarca"],
        codigoMedicion: json["CodigoMedicion"],
        codigomarcamedicion: json["codigomarcamedicion"],
        numDoc: json["NumDoc"],
        codMarcaMedicion: json["CodMarcaMedicion"],
        idModeloMedicion: json["IdModeloMedicion"],
        precio: json["Precio"].toDouble(),
        codigoUsuarioSys: json["CodigoUsuarioSys"],
        fechaMovil: json["FechaMovil"],
        fechaServidor: json["FechaServidor"],
        codigoProveedor: json["CodigoProveedor"],
    );

    Map<String, dynamic> toMap() => {
        "Codigo": codigo,
        "Descripcion": descripcion,
        "DescripcionMarca": descripcionMarca,
        "CodigoMedicion": codigoMedicion,
        "codigomarcamedicion": codigomarcamedicion,
        "NumDoc": numDoc,
        "CodMarcaMedicion": codMarcaMedicion,
        "IdModeloMedicion": idModeloMedicion,
        "Precio": precio,
        "CodigoUsuarioSys": codigoUsuarioSys,
        "FechaMovil": fechaMovil,
        "FechaServidor": fechaServidor,
        "CodigoProveedor": codigoProveedor,
    };
}
