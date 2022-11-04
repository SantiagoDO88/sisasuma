import 'package:uma/domain/rutero/historico_ventas/models/repuesto.dart';
import 'package:uma/domain/rutero/historico_ventas/models/vehiculo.dart';

abstract class HistoricoVentasInterface {
  Future<List<Repuesto?>> getListRepuestos(String codigo);

  Future<List<Repuesto?>> getListRepuestosPorMes(String codigo, int mes);

  Future<List<Vehiculo?>> getListVehiculos(String codigo);

  Future<List<Vehiculo?>> getListVehiculosPorMes(String codigo, int mes);
}
