import 'package:uma/domain/rutero/general/interface/rutero_interface.dart';
import 'package:uma/domain/rutero/general/models/rutero.dart';
import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';

class RuteroService {
  final RuteroInterface ruteroInterface;

  RuteroService({required this.ruteroInterface});

  Future<List<RuteroWithCliente>> getListRutero(int codigoDia,String filtro) {
    return ruteroInterface.getListRutero(codigoDia,filtro);
  }
}
