// To parse this JSON data, do
//
//     final estadoActividadSeguimientoPlan = estadoActividadSeguimientoPlanFromJson(jsonString);

import 'dart:convert';

EstadoActividadSeguimientoPlan estadoActividadSeguimientoPlanFromJson(
        String str) =>
    EstadoActividadSeguimientoPlan.fromJson(json.decode(str));

String estadoActividadSeguimientoPlanToJson(
        EstadoActividadSeguimientoPlan data) =>
    json.encode(data.toJson());

class EstadoActividadSeguimientoPlan {
  EstadoActividadSeguimientoPlan({
    this.id,
    this.descripcion,
    this.color,
    this.activo,
  });

  int? id;
  String? descripcion;
  String? color;
  int? activo;

  factory EstadoActividadSeguimientoPlan.fromJson(Map<String, dynamic> json) =>
      EstadoActividadSeguimientoPlan(
        id: json["id"] == null ? null : json["id"],
        descripcion: json["descripcion"] == null ? null : json["descripcion"],
        color: json["color"] == null ? null : json["color"],
        activo: json["activo"] == null ? null : json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "descripcion": descripcion == null ? null : descripcion,
        "color": color == null ? null : color,
        "activo": activo == null ? null : activo,
      };
}
