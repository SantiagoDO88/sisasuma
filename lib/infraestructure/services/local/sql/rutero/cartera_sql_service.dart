import 'package:uma/domain/rutero/cartera/models/cartera.dart';
import 'package:uma/infraestructure/services/local/sql/db_provider.dart';

class CarteraSqlService {

  
  static Future<Cartera?> getPortofolioClient(String codigo) async {
    final database = await DBProvider.db.database;

    var query = await database.rawQuery('''
      SELECT Cliente,Cupo,CarteraTotal,CarteraVencida,CarteraPorVencer,Edad1_15,Edad16_30,
      Edad31_45,Edad46_60,Edad61_75,EdadMayor_76,ProximoDocumentoVencer FROM Cartera WHERE Cliente =$codigo
    ''');

    await DBProvider.db.closeDataBases();

    return query.isNotEmpty
        ? query.map((data) => Cartera.fromJson(data)).first
        : null;
  }
}
