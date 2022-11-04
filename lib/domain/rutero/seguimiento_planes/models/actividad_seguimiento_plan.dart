// To parse this JSON data, do
//
//     final actividadSeguimientoPlan = actividadSeguimientoPlanFromJson(jsonString);

import 'dart:convert';

ActividadSeguimientoPlan actividadSeguimientoPlanFromJson(String str) =>
    ActividadSeguimientoPlan.fromJson(json.decode(str));

String actividadSeguimientoPlanToJson(ActividadSeguimientoPlan data) =>
    json.encode(data.toJson());

class ActividadSeguimientoPlan {
  ActividadSeguimientoPlan({
    this.id,
    this.descripcion,
    this.activo,
  });

  int? id;
  String? descripcion;
  int? activo;

  factory ActividadSeguimientoPlan.fromJson(Map<String, dynamic> json) =>
      ActividadSeguimientoPlan(
        id: json["id"] == null ? null : json["id"],
        descripcion: json["descripcion"] == null ? null : json["descripcion"],
        activo: json["activo"] == null ? null : json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "descripcion": descripcion == null ? null : descripcion,
        "activo": activo == null ? null : activo,
      };
}
