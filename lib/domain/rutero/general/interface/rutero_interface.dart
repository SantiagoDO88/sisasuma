import 'package:uma/domain/rutero/general/models/rutero.dart';
import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';

abstract class RuteroInterface {

  Future<List<RuteroWithCliente>> getListRutero(int codigoDia,String filtro);
}