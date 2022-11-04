import 'package:uma/domain/rutero/general/interface/rutero_interface.dart';
import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';
import 'package:uma/infraestructure/services/local/sql/rutero/general_sql_service.dart';

class RuteroRepositorySql implements RuteroInterface {
  @override
  Future<List<RuteroWithCliente>> getListRutero(int codigoDia, String filtro) {
    return GeneralSqlService.getListRutero(codigoDia, filtro);
  }
}
