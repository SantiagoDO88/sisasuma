import 'package:get/get.dart';
import 'package:uma/domain/rutero/cartera/models/cartera.dart';
import 'package:uma/domain/rutero/cartera/services/cartera_service.dart';
import 'package:uma/infraestructure/rutero/cartera/cartera_repository_sql.dart';

class CarteraController extends GetxController {

  final CarteraService _carteraService =CarteraService(carteraInterface:CarteraRepositorySql());

  String codigoCliente="10001047";

  late Cartera? cartera;

  Future<Cartera?>getCarteraClient(String codigo)async {
    if(codigo.isEmpty)return null;

    cartera = await _carteraService.getCarteraClient(codigo);
  
    return cartera;
  }


}


 