import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/estado_actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/seguimiento_plan.dart';
import 'package:uma/infraestructure/services/local/session/session_interface.dart';
import 'package:uma/infraestructure/services/local/session/session_service.dart';
import 'package:uma/infraestructure/services/local/sql/db_provider.dart';

class SeguimientoPlanesSql {
  static final SessionInterface _sessionInterface = SessionService();

  static Future<bool> agregarSeguimientoPlan(
      SeguimientoPlan seguimientoPlan) async {
    final temporal = await DBProvider.db.temporalDataBase;
    final RuteroWithCliente rutero = _sessionInterface.getRutero();

    try {
      await temporal.rawInsert('''

      INSERT INTO EncabezadoPlan(
      NumDoc,
      FechaInicio,
      PDV,
      IdActividadSeguimientoPlan,
      FechaInicioAccion,
      ResponsablePDV,
      FechaCompromisoAccion,
      FechaCierrePlan,
      IdEstadoSeguimientoPlan,
      DescripcionActividad,
      Email,
      CodigoCliente,
      CodigoUsuariosSys,
      IdFotoPlan
      )
        
        VALUES(
         '${seguimientoPlan.numeroDocumento}',
         '${seguimientoPlan.fechaInicio}',
         '${seguimientoPlan.puntoDeVenta}',
         '${seguimientoPlan.idActividadSeguimientoPlan}',
         '${seguimientoPlan.fechaInicioAccion}',
         '${seguimientoPlan.responsablePdv}',
         '${seguimientoPlan.fechaCompromisoAccion}',
         '${seguimientoPlan.fechaCierre}',
         ${seguimientoPlan.idEstadoSeguimientoPlan},
         '${seguimientoPlan.descripcionActividad}',
         '${rutero.email}',
         ${int.parse(rutero.codigoCliente!)},
         '${int.parse(rutero.codigoUsuarioSys!)}',
         '${seguimientoPlan.idFotoPlan}'
         )

    ''');
    } catch (error) {
      print(error);
      return false;
    }

    await DBProvider.db.closeDataBases();

    return true;
  }

  static Future<bool> editarSeguimientoPlan(
      SeguimientoPlan seguimientoPlan) async {
    final temporal = await DBProvider.db.temporalDataBase;

    try {
      var query = await temporal.rawUpdate('''
        UPDATE EncabezadoPlan
        SET
        FechaInicio = '${seguimientoPlan.fechaInicio}',
        PDV = '${seguimientoPlan.puntoDeVenta}',
        IdActividadSeguimientoPlan = '${seguimientoPlan.idActividadSeguimientoPlan}',
        FechaInicioAccion = '${seguimientoPlan.fechaInicioAccion}',
        ResponsablePDV = '${seguimientoPlan.responsablePdv}',
        FechaCompromisoAccion = '${seguimientoPlan.fechaCompromisoAccion}',
        FechaCierrePlan = '${seguimientoPlan.fechaCompromisoAccion}',
        IdEstadoSeguimientoPlan = ${seguimientoPlan.idEstadoSeguimientoPlan},
        DescripcionActividad = '${seguimientoPlan.descripcionActividad}',
        IdFotoPlan = '${seguimientoPlan.idFotoPlan}'

        WHERE NumDoc = ${seguimientoPlan.numeroDocumento}
        ''');
      print(query);
    } catch (e) {
      print(e);
      return false;
    }

    await DBProvider.db.closeDataBases();

    return true;
  }

  static Future<bool> eliminarSeguimientoPlan(SeguimientoPlan seguimientoPlan) async {
    final temporal = await DBProvider.db.temporalDataBase;

    try {
      await temporal.rawInsert('''

          DELETE FROM EncabezadoPlan 
          where NumDoc='${seguimientoPlan.numeroDocumento}'

          ''');
    } catch (error) {
      print(error);
      return false;
    }

    await DBProvider.db.closeDataBases();

    return true;
  }

  static Future<List<SeguimientoPlan>> obtenerSeguimientoPlanes() async {
    final temporal = await DBProvider.db.temporalDataBase;
    final database = await DBProvider.db.database;

    await database.execute(''' ATTACH DATABASE '${temporal.path}' as DATAS ''');

    var query = await database.rawQuery('''

      SELECT 
      ep.NumDoc as numeroDocumento,
      ep.FechaInicio as fechaInicio,
      ep.PDV as puntoDeVenta,
      ep.IdActividadSeguimientoPlan as idActividadSeguimientoPlan,
      asp.Descripcion as descripcionActividadDropDown,
      ep.FechaInicioAccion as fechaInicioAccion,
      ep.ResponsablePDV as responsablePdv,
      ep.FechaCompromisoAccion as fechaCompromisoAccion,
      ep.FechaCierrePlan as fechaCierre,
      ep.IdEstadoSeguimientoPlan as idEstadoSeguimientoPlan,
      esp.Descripcion as descripcionEstadoActividadDropDown,
      ep.DescripcionActividad as descripcionActividad,
      ep.Email as email,
      ep.CodigoCliente as codigoCliente,
      ep.CodigoUsuariosSys as codigoUsuarioSys,
      ep.IdFotoPlan as idFotoPlan
      
      FROM DATAS.EncabezadoPlan as ep
      INNER JOIN ActividadSeguimientoPlan as asp
      ON ep.IdActividadSeguimientoPlan = asp.Id
      INNER JOIN EstadoSeguimientoPlan as esp
      ON ep.IdEstadoSeguimientoPlan = esp.Id
  
    ''');

    await database.execute(''' DETACH DATABASE 'DATAS' ''');

    await DBProvider.db.closeDataBases();

    return query.isNotEmpty
        ? query.map((element) => SeguimientoPlan.fromJson(element)).toList()
        : [];
  }

  static Future<List<ActividadSeguimientoPlan>>
      obtenerActividadesSeguimientoPlanes() async {
    final dataBase = await DBProvider.db.database;

    var query = await dataBase.rawQuery('''

      SELECT 
      Id as id,
      Descripcion as descripcion,
      Activo as activo
      
      FROM ActividadSeguimientoPlan
      WHERE activo = 1
    
    ''');

    await DBProvider.db.closeDataBases();

    return query.isNotEmpty
        ? query
            .map((element) => ActividadSeguimientoPlan.fromJson(element))
            .toList()
        : [];
  }

  static Future<List<EstadoActividadSeguimientoPlan>>
      obtenerEstadoActidadSeguimientoPlanes() async {
    final dataBase = await DBProvider.db.database;

    var query = await dataBase.rawQuery('''

      SELECT 
      Id as id,
      Descripcion as descripcion,
      Color as color,
      Activo as activo
      
      FROM EstadoSeguimientoPlan
      WHERE activo = 0
    
    ''');

    await DBProvider.db.closeDataBases();

    return query.isNotEmpty
        ? query
            .map((element) => EstadoActividadSeguimientoPlan.fromJson(element))
            .toList()
        : [];
  }
}
