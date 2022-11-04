import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';
import 'package:uma/infraestructure/services/local/sql/db_provider.dart';

class GeneralSqlService {
  static Future<List<RuteroWithCliente>> getListRutero(
      int codigoDia, String filtro) async {
    final database = await DBProvider.db.database;
    try{
    var query = await database.rawQuery('''

Select * from Rutero r inner join Cliente c on r.CodigoCliente =c.Codigo  where r.CodigoDia =$codigoDia
      and (c.NombreCliente LIKE '%$filtro%' OR c.Documento LIKE '%$filtro%' ) 
      
      ''');

    await DBProvider.db.closeDataBases();

    print(query);

   return query.isNotEmpty
        ? query.map((valor) => RuteroWithCliente.fromJson(valor)).toList()
          : [];
  } catch(e){
    return [];
  }

    

    //return query.isNotEmpty
    //    ? query.map((element) => Vehiculo.fromMap(element)).toList()
    //    : [];
  }
}
