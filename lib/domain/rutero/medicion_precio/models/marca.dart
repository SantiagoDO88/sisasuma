import 'dart:convert';

class Marca {
    Marca({
        this.codigo,
        this.descripcion,
    });

    String? codigo;
    String? descripcion;

    factory Marca.fromJson(String str) => Marca.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Marca.fromMap(Map<String, dynamic> json) => Marca(
        codigo: json["Codigo"],
        descripcion: json["Descripcion"],
    );

    Map<String, dynamic> toMap() => {
        "Codigo": codigo,
        "Descripcion": descripcion,
    };
}
