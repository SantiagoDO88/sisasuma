import 'package:uma/domain/start_day/model/start_day.dart';
import 'package:uma/infraestructure/services/local/session/session_interface.dart';
import 'package:uma/infraestructure/services/local/session/session_service.dart';
import 'package:uma/infraestructure/services/local/sql/db_provider.dart';

class StartDaySqlService {
  static final SessionInterface _sessionInterface = SessionService();

  static Future<bool> hasAlreadyStartedHisDay() async {
    final temporal = await DBProvider.db.temporalDataBase;

    var query = await temporal.rawQuery('''

      SELECT COUNT (*) as cantidad 
      FROM InicioLabores 
      WHERE Fecha = '2022-10-14' 

    ''');

    await DBProvider.db.closeDataBases();

    Map<dynamic, dynamic> lista = query.first;

    print("${lista['cantidad']}");

    if (lista['cantidad'] > 0) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> saveDayStart(StartDay startDay) async {
    final temporal = await DBProvider.db.temporalDataBase;

    try {
      
      await temporal.rawInsert('''

      INSERT INTO InicioLabores(CodigoUsuarioSys,
      Fecha,
      Imei,
      Version,
      CodigoProveedor,
      FechaCons,
      KmInicial,
      IdFotoKM)
        
        VALUES
         ('${startDay.codigoUsuario}', 
         '${startDay.fecha}',
         '${startDay.imei}',
         '${startDay.version}',
         '${startDay.codigoProveedor}',
         '${startDay.fechaCons}',
         '${startDay.kmFinal}',
         '${startDay.idFotoKm}')

    ''');
    } catch (error) {
      print(error);
      return false;
    }

    await DBProvider.db.closeDataBases();

    return true;
  }
}
