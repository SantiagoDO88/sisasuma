import 'package:uma/domain/rutero/seguimiento_planes/interface/seguimiento_planes_interface.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/estado_actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/seguimiento_plan.dart';
import 'package:uma/infraestructure/services/local/sql/rutero/seguimiento_planes_sql.dart';

class SeguimientoPlanesRepositorySql implements SeguimientoPlanesInterface {
  @override
  Future<bool> agregarSeguimientoPlan(SeguimientoPlan seguimientoPlan) async {
    return await SeguimientoPlanesSql.agregarSeguimientoPlan(seguimientoPlan);
  }

  @override
  Future<bool> editarSeguimientoPlan(SeguimientoPlan seguimientoPlan) async {
    return await SeguimientoPlanesSql.editarSeguimientoPlan(seguimientoPlan);
  }

  @override
  Future<bool> eliminarSeguimientoPlan(SeguimientoPlan seguimientoPlan) async {
    return await SeguimientoPlanesSql.eliminarSeguimientoPlan(seguimientoPlan);
  }

  @override
  Future<List<SeguimientoPlan>> obtenerSeguimientoPlanes() async {
    return await SeguimientoPlanesSql.obtenerSeguimientoPlanes();
  }

  @override
  Future<List<ActividadSeguimientoPlan>>
      obtenerActividadesSeguimientoPlanes() async {
    return await SeguimientoPlanesSql.obtenerActividadesSeguimientoPlanes();
  }

  @override
  Future<List<EstadoActividadSeguimientoPlan>>
      obtenerEstadoActidadSeguimientoPlanes() async {
    return await SeguimientoPlanesSql.obtenerEstadoActidadSeguimientoPlanes();
  }
}
