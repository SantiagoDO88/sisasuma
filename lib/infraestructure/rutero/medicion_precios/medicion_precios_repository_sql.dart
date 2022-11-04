import 'package:uma/domain/rutero/medicion_precio/interfaces/medicion_precios_interface.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio.dart';
import 'package:uma/domain/rutero/medicion_precio/models/marca.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio_temp.dart';
import 'package:uma/domain/rutero/medicion_precio/models/modelo.dart';
import 'package:uma/infraestructure/services/local/sql/medicion_precios/medicion_precios_sql_service.dart';

class MedicionPreciosRepositorySql implements MedicionPreciosInterface {
  @override
  Future<List<Marca>> getListMarcas() {
    return MedicionPreciosSqlService.getListMarcas();
  }

  @override
  Future<List<MedicionPrecio?>> getListMedicionesPrecios(String numDoc) {
    return MedicionPreciosSqlService.getListMedicionesPrecios(numDoc);
  }
  @override
  Future<List<MedicionPrecio?>> getListMedicionesPreciosTemp(String numDoc) {
    return MedicionPreciosSqlService.getListMedicionesPreciosTemp(numDoc);
  }
  
  @override
  Future<List<Modelo>> getListModelosDependMarca(String idMarca) {
    return MedicionPreciosSqlService.getListModelosDependMarca( idMarca);

  }

  @override
  Future<bool> deleteMedicionPrecio(MedicionPrecio medicion) {
return MedicionPreciosSqlService.deleteMedicionPrecio(medicion);

  }

  @override
  Future<bool> editMedicionPrecio(MedicionPrecioTemp medicion) {
return MedicionPreciosSqlService.editMedicionPrecio(medicion);

  }

  @override
  Future<bool> saveMedicionPrecio(MedicionPrecioTemp medicion) {
return MedicionPreciosSqlService.saveMedicionPrecio(medicion);

  }
  

}
