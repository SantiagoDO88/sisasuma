import 'package:uma/domain/rutero/historico_ventas/interface/historico_ventas_interface.dart';
import 'package:uma/domain/rutero/historico_ventas/models/repuesto.dart';
import 'package:uma/domain/rutero/historico_ventas/models/vehiculo.dart';
import 'package:uma/infraestructure/services/local/sql/rutero/historico_ventas_sql_service.dart';

class HistoricoVentasRepositorySql implements HistoricoVentasInterface{

  @override
  Future<List<Repuesto?>> getListRepuestos(String codigo) {
   return HistoricoVentasSqlService.getListRepuestos(codigo);
  }

  @override
  Future<List<Vehiculo?>> getListVehiculos(String codigo) {
    return HistoricoVentasSqlService.getListVehiculos(codigo);
  }
  
  @override
  Future<List<Repuesto?>> getListRepuestosPorMes(String codigo, int mes) {
return HistoricoVentasSqlService.getListRepuestosPorMes(codigo,mes);
  }
  
  @override
  Future<List<Vehiculo?>> getListVehiculosPorMes(String codigo, int mes) {
    return HistoricoVentasSqlService.getListVehiculosPorMes(codigo,mes);

  }



}