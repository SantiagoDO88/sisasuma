import 'package:uma/domain/rutero/historico_ventas/interface/historico_ventas_interface.dart';
import 'package:uma/domain/rutero/historico_ventas/models/repuesto.dart';
import 'package:uma/domain/rutero/historico_ventas/models/vehiculo.dart';

class HistoricoVentasService {
  final HistoricoVentasInterface historicoVentasInterface;

  HistoricoVentasService({required this.historicoVentasInterface});

  Future<List<Repuesto?>> getListHistoricoRespuestos(String codigo) {
    return historicoVentasInterface.getListRepuestos(codigo);
  }

  Future<List<Repuesto?>> getListHistoricoRespuestosPorMes(
      String codigo, int mes) {
    return historicoVentasInterface.getListRepuestosPorMes(codigo, mes);
  }

  Future<List<Vehiculo?>> getListHistoricoVehiculos(String codigo) {
    return historicoVentasInterface.getListVehiculos(codigo);
  }

  Future<List<Vehiculo?>> getListHistoricoVehiculosPorMes(
      String codigo, int mes) {
    return historicoVentasInterface.getListVehiculosPorMes(codigo, mes);
  }
}
