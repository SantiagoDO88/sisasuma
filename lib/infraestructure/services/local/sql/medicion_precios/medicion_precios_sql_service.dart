import 'package:uma/domain/rutero/medicion_precio/models/marca.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio_temp.dart';
import 'package:uma/domain/rutero/medicion_precio/models/modelo.dart';
import 'package:uma/infraestructure/services/local/sql/db_provider.dart';

class MedicionPreciosSqlService {
  static Future<List<Marca>> getListMarcas() async {
    final database = await DBProvider.db.database;
    try {
      var query = await database.rawQuery('''Select * from MarcaMedicion''');

      await DBProvider.db.closeDataBases();

      print(query);

      return query.isNotEmpty
          ? query.map((valor) => Marca.fromMap(valor)).toList()
          : [];
    } catch (e) {
      return [];
    }
  }

  static Future<List<Modelo>> getListModelosDependMarca(String idMarca) async {
    final database = await DBProvider.db.database;
    try {
      var query = await database.rawQuery(
          '''SELECT * FROM ModeloMedicion WHERE codigomarcamedicion=$idMarca  ''');

      await DBProvider.db.closeDataBases();

      print(query);

      return query.isNotEmpty
          ? query.map((valor) => Modelo.fromMap(valor)).toList()
          : [];
    } catch (e) {
      return [];
    }
  }

  static Future<List<MedicionPrecio>> getListMedicionesPrecios(
      String numdoc) async {
    final database = await DBProvider.db.database;
    try {
      var query = await database.rawQuery('''

      SELECT ma.*,ma.descripcion as DescripcionMarca, mo.*,mp.* FROM MarcaMedicion ma 
      INNER JOIN ModeloMedicion mo ON ma.codigo = mo.codigomarcamedicion 
      INNER JOIN MedicionPrecio mp ON mp.IdModeloMedicion = mo.codigomedicion WHERE mp.CodigoCliente  =$numdoc

      ''');

      await DBProvider.db.closeDataBases();

      List<MedicionPrecio> listMediciones =
          query.map((valor) => MedicionPrecio.fromMap(valor)).toList();

      return query.isNotEmpty
          ? query.map((valor) => MedicionPrecio.fromMap(valor)).toList()
          : [];
    } catch (e) {
      return [];
    }
  }

  static Future<List<MedicionPrecio>> getListMedicionesPreciosTemp(
      String numdoc) async {
    final temporal = await DBProvider.db.temporalDataBase;
    final database = await DBProvider.db.database;
    try {
      await temporal
          .execute(''' ATTACH DATABASE '${database.path}' as DATAS ''');

      var query = await temporal.rawQuery('''
      SELECT ma.*,ma.descripcion as DescripcionMarca, mo.*,mp.* FROM MarcaMedicion ma 
      INNER JOIN ModeloMedicion mo ON ma.codigo = mo.codigomarcamedicion 
      INNER JOIN MedicionPrecio mp ON mp.IdModeloMedicion = mo.codigomedicion WHERE mp.CodigoCliente  =$numdoc
      
      ''');

      await temporal.execute(''' DETACH DATABASE 'DATAS' ''');
      print(query);
      await DBProvider.db.closeDataBases();

      print(query);
      List<MedicionPrecio> listMediciones =
          query.map((valor) => MedicionPrecio.fromMap(valor)).toList();

      return query.isNotEmpty
          ? query.map((valor) => MedicionPrecio.fromMap(valor)).toList()
          : [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<bool> saveMedicionPrecio(MedicionPrecioTemp medicion) async {
    final temporal = await DBProvider.db.temporalDataBase;

    try {
      var query = await temporal.rawInsert('''

      INSERT INTO MedicionPrecio(
      NumDoc,
      CodMarcaMedicion,
      IdModeloMedicion,
      Precio,
      CodigoUsuarioSys,
      FechaMovil,
      FechaServidor,
      CodigoProveedor,
      CodigoCliente
      )VALUES(
        '${medicion.numDoc}', 
        '${medicion.codMarcaMedicion}', 
        '${medicion.idModeloMedicion}',
        '${medicion.precio}',
        '${medicion.codigoUsuarioSys}',
        '${medicion.fechaMovil}',
        '${medicion.fechaServidor}',
        '${medicion.codigoProveedor}',
        '${medicion.codigoCliente}'
        )

    ''');
      print(query);
    } catch (error) {
      print(error);
      return false;
    }

    await DBProvider.db.closeDataBases();

    return true;
  }

  static Future<bool> deleteMedicionPrecio(
      MedicionPrecio medicionPrecio) async {
    final temporal = await DBProvider.db.temporalDataBase;

    try {
      await temporal.rawInsert('''DELETE FROM MedicionPrecio 
          where NumDoc='${medicionPrecio.numDoc}'
          ''');
    } catch (error) {
      print(error);
      return false;
    }

    await DBProvider.db.closeDataBases();

    return true;
  }

  static Future<bool> editMedicionPrecio(MedicionPrecioTemp medicion) async {
    final temporal = await DBProvider.db.temporalDataBase;

    print('''UPDATE MedicionPrecio
        SET 
        CodMarcaMedicion =  '${medicion.codMarcaMedicion}',
        IdModeloMedicion = '${medicion.idModeloMedicion}',
        Precio = '${medicion.precio}',
        FechaMovil = '${medicion.fechaMovil}',
        FechaServidor = '${medicion.fechaServidor}',
        WHERE NumDoc=${medicion.numDoc}''');
    try {
      var query = await temporal.rawInsert('''
        UPDATE MedicionPrecio
        SET 
        CodMarcaMedicion =  '${medicion.codMarcaMedicion}',
        IdModeloMedicion = '${medicion.idModeloMedicion}',
        Precio = '${medicion.precio}',
        FechaMovil = '${medicion.fechaMovil}',
        FechaServidor = '${medicion.fechaServidor}'
        WHERE NumDoc='${medicion.numDoc}'
    ''');

      print(query);
    } catch (error) {
      print(error);
      return false;
    }

    await DBProvider.db.closeDataBases();

    return true;
  }
}
