import 'dart:convert';

class Vehiculo {
    Vehiculo({
        this.id,
        this.anio,
        this.mes,
        this.cantidadMesTotal,
        this.cantidad,
        this.codigoMaterial,
        this.descripcionMaterial,
        this.valorVentaMesActual,
        this.valorVentaMesAoAnterior,
        this.cantidadVentaMesActual,
        this.cantidadVentaMesAoAnterior,
        this.cantidadVentasUltimos3Meses,
        this.codigoCliente,
        this.fechaServer,
    });

    int? id;
    int? anio;
    int? mes;
    double? cantidadMesTotal;
    double? cantidad;
    String? codigoMaterial;
    String? descripcionMaterial;
    double? valorVentaMesActual;
    double? valorVentaMesAoAnterior;
    double? cantidadVentaMesActual;
    double? cantidadVentaMesAoAnterior;
    double? cantidadVentasUltimos3Meses;
    String? codigoCliente;
    String? fechaServer;

    factory Vehiculo.fromJson(String str) => Vehiculo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Vehiculo.fromMap(Map<String, dynamic> json) => Vehiculo(
        id: json["Id"],
        anio: json["Año"],
        mes: json["Mes"],
        cantidadMesTotal: json["CantidadMesTotal"],
        cantidad: json["Cantidad"].toDouble(),
        codigoMaterial: json["CodigoMaterial"],
        descripcionMaterial: json["DescripcionMaterial"],
        valorVentaMesActual: json["ValorVentaMesActual"].toDouble(),
        valorVentaMesAoAnterior: json["ValorVentaMesAñoAnterior"].toDouble(),
        cantidadVentaMesActual: json["CantidadVentaMesActual"].toDouble(),
        cantidadVentaMesAoAnterior: json["CantidadVentaMesAñoAnterior"].toDouble(),
        cantidadVentasUltimos3Meses: json["CantidadVentasUltimos3Meses"].toDouble(),
        codigoCliente: json["CodigoCliente"],
        fechaServer: json["FechaServer"],
    );

    Map<String, dynamic> toMap() => {
        "Id": id,
        "Año": anio,
        "Mes": mes,
        "CantidadMesTotal":cantidadMesTotal,
        "Cantidad": cantidad,
        "CodigoMaterial": codigoMaterial,
        "DescripcionMaterial": descripcionMaterial,
        "ValorVentaMesActual": valorVentaMesActual,
        "ValorVentaMesAñoAnterior": valorVentaMesAoAnterior,
        "CantidadVentaMesActual": cantidadVentaMesActual,
        "CantidadVentaMesAñoAnterior": cantidadVentaMesAoAnterior,
        "CantidadVentasUltimos3Meses": cantidadVentasUltimos3Meses,
        "CodigoCliente": codigoCliente,
        "FechaServer": fechaServer,
    };
}