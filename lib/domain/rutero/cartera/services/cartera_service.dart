import 'package:uma/domain/rutero/cartera/interface/cartera_interface.dart';
import 'package:uma/domain/rutero/cartera/models/cartera.dart';

class CarteraService {
  final CarteraInterface carteraInterface;

  CarteraService({required this.carteraInterface});

  Future<Cartera?> getCarteraClient(String codigo){
    return carteraInterface.getPortofolioClient( codigo);
  }
}