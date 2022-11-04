import 'package:uma/domain/rutero/medicion_precio/models/marca.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio_temp.dart';
import 'package:uma/domain/rutero/medicion_precio/models/modelo.dart';

abstract class MedicionPreciosInterface {
  Future<List<Marca>> getListMarcas();

  Future<List<Modelo>> getListModelosDependMarca(String idMarca);

  Future<List<MedicionPrecio?>> getListMedicionesPrecios(String numDoc);

  Future<List<MedicionPrecio?>> getListMedicionesPreciosTemp(String numDoc);

  Future<bool> saveMedicionPrecio(MedicionPrecioTemp medicion);

  Future<bool> editMedicionPrecio(MedicionPrecioTemp medicion);

  Future<bool> deleteMedicionPrecio(MedicionPrecio medicion);
}
