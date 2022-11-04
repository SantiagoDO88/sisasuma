import 'dart:convert';

class Repuesto {
    Repuesto({
        this.id,
        this.anio,
        this.mes,
        this.valorVentaMesTotal,
        this.valorVenta,
        this.codigoMaterial,
        this.descripcionMaterial,
        this.valorVentaMesActual,
        this.valorVentaMesAoAnterior,
        this.cantidadVentaMesActual,
        this.cantidadVentaMesAoAnterior,
        this.cantidadVEntasUltimos3Meses,
        this.codigoCliente,
        this.fechaServer,
    });

    int? id;
    int? anio;
    int? mes;
    double? valorVentaMesTotal;
    double? valorVenta;
    String? codigoMaterial;
    String? descripcionMaterial;
    double? valorVentaMesActual;
    double? valorVentaMesAoAnterior;
    double? cantidadVentaMesActual;
    double? cantidadVentaMesAoAnterior;
    double? cantidadVEntasUltimos3Meses;
    String? codigoCliente;
    String? fechaServer;

    factory Repuesto.fromJson(String str) => Repuesto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Repuesto.fromMap(Map<String, dynamic> json) => Repuesto(
        id: json["Id"],
        anio: json["Año"],
        mes: json["Mes"],
        valorVentaMesTotal:json["ValorVentaMesTotal"],
        valorVenta: json["ValorVenta"].toDouble(),
        codigoMaterial: json["CodigoMaterial"],
        descripcionMaterial: json["DescripcionMaterial"],
        valorVentaMesActual: json["ValorVentaMesActual"].toDouble(),
        valorVentaMesAoAnterior: json["ValorVentaMesAñoAnterior"].toDouble(),
        cantidadVentaMesActual: json["CantidadVentaMesActual"].toDouble(),
        cantidadVentaMesAoAnterior: json["CantidadVentaMesAñoAnterior"].toDouble(),
        cantidadVEntasUltimos3Meses: json["CantidadVEntasUltimos3Meses"].toDouble(),
        codigoCliente: json["CodigoCliente"],
        fechaServer: json["FechaServer"],
    );

    Map<String, dynamic> toMap() => {
        "Id": id,
        "Año": anio,
        "Mes": mes,
        "ValorVentaMesTotal": valorVentaMesTotal,
        "ValorVenta": valorVenta,
        "CodigoMaterial": codigoMaterial,
        "DescripcionMaterial": descripcionMaterial,
        "ValorVentaMesActual": valorVentaMesActual,
        "ValorVentaMesAñoAnterior": valorVentaMesAoAnterior,
        "CantidadVentaMesActual": cantidadVentaMesActual,
        "CantidadVentaMesAñoAnterior": cantidadVentaMesAoAnterior,
        "CantidadVEntasUltimos3Meses": cantidadVEntasUltimos3Meses,
        "CodigoCliente": codigoCliente,
        "FechaServer": fechaServer,
    };
}




