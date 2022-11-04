import 'package:uma/domain/rutero/seguimiento_planes/models/actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/estado_actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/seguimiento_plan.dart';

abstract class SeguimientoPlanesInterface {
  Future<bool> agregarSeguimientoPlan(SeguimientoPlan seguimientoPlan);
  Future<bool> editarSeguimientoPlan(SeguimientoPlan seguimientoPlan);
  Future<bool> eliminarSeguimientoPlan(SeguimientoPlan seguimientoPlan);
  Future<List<SeguimientoPlan>> obtenerSeguimientoPlanes();
  Future<List<ActividadSeguimientoPlan>> obtenerActividadesSeguimientoPlanes();
  Future<List<EstadoActividadSeguimientoPlan>> obtenerEstadoActidadSeguimientoPlanes();
}
