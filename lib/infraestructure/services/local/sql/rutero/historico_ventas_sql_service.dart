import 'package:uma/domain/rutero/historico_ventas/models/repuesto.dart';
import 'package:uma/domain/rutero/historico_ventas/models/vehiculo.dart';
import 'package:uma/infraestructure/services/local/sql/db_provider.dart';

class HistoricoVentasSqlService {
  static Future<List<Repuesto?>> getListRepuestos(String codigoCliente) async {
    final database = await DBProvider.db.database;

    var query = await database.rawQuery('''
      Select sum (hr.ValorVenta) as ValorVentaMesTotal ,hr.* from HistoricoRepuestos hr where CodigoCliente =$codigoCliente  group by hr.mes  order by hr.mes DESC;
    ''');

    await DBProvider.db.closeDataBases();

    return query.isNotEmpty
        ? query.map((element) => Repuesto.fromMap(element)).toList()
        : [];
  }

  static Future<List<Repuesto?>> getListRepuestosPorMes(
      String codigoCliente, int mes) async {
    final database = await DBProvider.db.database;

    var query = await database.rawQuery('''
    Select hr.* from HistoricoRepuestos hr where hr.CodigoCliente =$codigoCliente and hr.mes=$mes  order by hr.ValorVenta  ASC;

    
    ''');

    await DBProvider.db.closeDataBases();

    return query.isNotEmpty
        ? query.map((element) => Repuesto.fromMap(element)).toList()
        : [];
  }

  static Future<List<Vehiculo?>> getListVehiculos(String codigoCliente) async {
    final database = await DBProvider.db.database;

    var query = await database.rawQuery('''

Select sum(hv.Cantidad) as CantidadMesTotal ,hv.* from HistoricoVehiculos hv where CodigoCliente =$codigoCliente  group by hv.mes  order by hv.Mes  DESC;
    ''');

    await DBProvider.db.closeDataBases();

    return query.isNotEmpty
        ? query.map((element) => Vehiculo.fromMap(element)).toList()
        : [];
  }

  static Future<List<Vehiculo?>> getListVehiculosPorMes(
      String codigoCliente, int mes) async {
    final database = await DBProvider.db.database;

    var query = await database.rawQuery('''
Select hv.* from HistoricoVehiculos hv where hv.CodigoCliente =$codigoCliente  and hv.Mes =$mes order by hv.Cantidad  ASC;
    ''');

    await DBProvider.db.closeDataBases();

    return query.isNotEmpty
        ? query.map((element) => Vehiculo.fromMap(element)).toList()
        : [];
  }
}
