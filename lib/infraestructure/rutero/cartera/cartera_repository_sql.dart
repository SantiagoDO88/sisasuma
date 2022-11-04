import 'package:uma/domain/rutero/cartera/interface/cartera_interface.dart';
import 'package:uma/domain/rutero/cartera/models/cartera.dart';
import 'package:uma/infraestructure/services/local/sql/rutero/cartera_sql_service.dart';

class CarteraRepositorySql implements CarteraInterface{
  
  
  @override
  Future<Cartera?> getPortofolioClient(String codigo) {
    return CarteraSqlService.getPortofolioClient(codigo);
  }


}