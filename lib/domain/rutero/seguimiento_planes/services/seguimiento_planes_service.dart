import 'package:uma/domain/rutero/seguimiento_planes/interface/seguimiento_planes_interface.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/estado_actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/seguimiento_plan.dart';

class SeguimientoPlanesService {
  final SeguimientoPlanesInterface seguimientoPlanesInterface;

  SeguimientoPlanesService({required this.seguimientoPlanesInterface});

  Future<bool> agregarSeguimientoPlan(SeguimientoPlan seguimientoPlan) {
    return seguimientoPlanesInterface.agregarSeguimientoPlan(seguimientoPlan);
  }

  Future<bool> editarSeguimientoPlan(SeguimientoPlan seguimientoPlan) {
    return seguimientoPlanesInterface.editarSeguimientoPlan(seguimientoPlan);
  }

  Future<bool> eliminarSeguimientoPlan(SeguimientoPlan seguimientoPlan) {
    return seguimientoPlanesInterface.eliminarSeguimientoPlan(seguimientoPlan);
  }

  Future<List<SeguimientoPlan>> obtenerSeguimientoPlanes() {
    return seguimientoPlanesInterface.obtenerSeguimientoPlanes();
  }

  Future<List<ActividadSeguimientoPlan>> obtenerActividadesSeguimientoPlanes() {
    return seguimientoPlanesInterface.obtenerActividadesSeguimientoPlanes();
  }

  Future<List<EstadoActividadSeguimientoPlan>> obtenerEstadoActividadSeguimientoPlanes() {
    return seguimientoPlanesInterface.obtenerEstadoActidadSeguimientoPlanes();
  }
}
