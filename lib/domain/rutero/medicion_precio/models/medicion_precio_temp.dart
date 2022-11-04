

// To parse this JSON data, do
//
//     final medicionPrecioTemp = medicionPrecioTempFromMap(jsonString);

import 'dart:convert';

class MedicionPrecioTemp {
    MedicionPrecioTemp({
        this.numDoc,
        this.codMarcaMedicion,
        this.idModeloMedicion,
        this.precio,
        this.codigoUsuarioSys,
        this.fechaMovil,
        this.fechaServidor,
        this.codigoProveedor,
        this.estado,
        this.codigoCliente
    });

    String? numDoc;
    String? codMarcaMedicion;
    int? idModeloMedicion;
    double? precio;
    String? codigoUsuarioSys;
    String? fechaMovil;
    String? fechaServidor;
    int? codigoProveedor;
    String? estado;
    String? codigoCliente;

    factory MedicionPrecioTemp.fromJson(String str) => MedicionPrecioTemp.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MedicionPrecioTemp.fromMap(Map<String, dynamic> json) => MedicionPrecioTemp(
        numDoc: json["NumDoc"],
        codMarcaMedicion: json["CodMarcaMedicion"],
        idModeloMedicion: json["IdModeloMedicion"],
        precio: json["Precio"].toDouble(),
        codigoUsuarioSys: json["CodigoUsuarioSys"],
        fechaMovil: json["FechaMovil"],
        fechaServidor: json["FechaServidor"],
        codigoProveedor: json["CodigoProveedor"],
        estado: json["Estado"],
        codigoCliente:json["CodigoCliente"]
    );

    Map<String, dynamic> toMap() => {
        "NumDoc": numDoc,
        "CodMarcaMedicion": codMarcaMedicion,
        "IdModeloMedicion": idModeloMedicion,
        "Precio": precio,
        "CodigoUsuarioSys": codigoUsuarioSys,
        "FechaMovil": fechaMovil,
        "FechaServidor": fechaServidor,
        "CodigoProveedor": codigoProveedor,
        "Estado": estado,
        "CodigoCliente":codigoCliente
        
    };
}

// {
// "NumDoc": "a",
// "CodMarca": "a",
// "IdModelo": 12,
// "Precio": 12.54,
// "CodigoUsuarioSys": "",
// "FechaMovil": "",
// "FechaServidor": "",
// "CodigoProveedor": 12,
// "Estado":"false"
// }