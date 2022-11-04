import 'package:uma/domain/rutero/cartera/models/cartera.dart';

abstract class CarteraInterface {

  Future<Cartera?> getPortofolioClient(String codigo);
}