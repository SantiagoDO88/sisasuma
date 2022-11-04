// To parse this JSON data, do
//
//     final cartera = carteraFromJson(jsonString);

import 'dart:convert';

class Cartera {
    Cartera({
        this.cliente,
        this.cupo,
        this.carteraTotal,
        this.carteraVencida,
        this.carteraPorVencer,
        this.edad115,
        this.edad1630,
        this.edad3145,
        this.edad4660,
        this.edad6175,
        this.edadMayor76,
        this.proximoDocumentoVencer
    });

    String? cliente;
    double? cupo;
    double? carteraTotal;
    double? carteraVencida;
    double? carteraPorVencer;
    double? edad115;
    double? edad1630;
    double? edad3145;
    double? edad4660;
    double? edad6175;
    double? edadMayor76;
    String? proximoDocumentoVencer;

    factory Cartera.fromRawJson(String str) => Cartera.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Cartera.fromJson(Map<String, dynamic> json) => Cartera(
        cliente: json["Cliente"],
        cupo: json["Cupo"],
        carteraTotal: json["CarteraTotal"],
        carteraVencida: json["CarteraVencida"] ,
        carteraPorVencer: json["CarteraPorVencer"] ,
        edad115: json["Edad1_15"],
        edad1630: json["Edad16_30"] ,
        edad3145: json["Edad31_45"] ,
        edad4660: json["Edad46_60"] ,
        edad6175: json["Edad61_75"] ,
        edadMayor76: json["EdadMayor_76"],
        proximoDocumentoVencer:json["ProximoDocumentoVencer"]
    );

    Map<String, dynamic> toJson() => {
        "Cliente": cliente,
        "Cupo": cupo,
        "CarteraTotal": carteraTotal,
        "CarteraVencida": carteraVencida ,
        "CarteraPorVencer": carteraPorVencer ,
        "Edad1_15": edad115,
        "Edad16_30": edad1630,
        "Edad31_45": edad3145,
        "Edad46_60": edad4660,
        "Edad61_75": edad6175,
        "EdadMayor_76": edadMayor76,
        "ProximoDocumentoVencer": proximoDocumentoVencer
    };
}
