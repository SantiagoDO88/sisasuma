import 'package:uma/domain/rutero/medicion_precio/interfaces/medicion_precios_interface.dart';
import 'package:uma/domain/rutero/medicion_precio/models/marca.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio_temp.dart';
import 'package:uma/domain/rutero/medicion_precio/models/modelo.dart';

class MedicionPrecioService {
  final MedicionPreciosInterface MedicionPrecioInterface;

  MedicionPrecioService({required this.MedicionPrecioInterface});

  Future<List<Marca>> getListMarcas() {
    return MedicionPrecioInterface.getListMarcas();
  }

    Future<List<Modelo>> getListModelosDependMarca(String idMarca) {
    return MedicionPrecioInterface.getListModelosDependMarca(idMarca);
  }


  Future<List<MedicionPrecio?>> getListMedicionesPrecios(String numDoc) {
    return MedicionPrecioInterface.getListMedicionesPrecios(numDoc);
  }

  Future<List<MedicionPrecio?>> getListMedicionesPreciosTemp(String numDoc) {
    return MedicionPrecioInterface.getListMedicionesPreciosTemp(numDoc);
  }

  Future<bool> saveMedicionPrecio(MedicionPrecioTemp medicion) {
    return MedicionPrecioInterface.saveMedicionPrecio(medicion);
  }

  Future<bool> deleteMedicionPrecio(MedicionPrecio medicion) {
    return MedicionPrecioInterface.deleteMedicionPrecio(medicion);
  }
   Future<bool> editMedicionPrecio(MedicionPrecioTemp medicion) {
    return MedicionPrecioInterface.editMedicionPrecio(medicion);
  }

}
