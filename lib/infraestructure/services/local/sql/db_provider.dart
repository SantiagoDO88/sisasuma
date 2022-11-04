import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:uma/infraestructure/utils/utils.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static Database? _temporalDataBase;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) await _database!.close();

    _database = await initDataBase();

    print('Opening DataBase');

    return _database!;
  }

  Future<void> closeDataBase() async {
    await _database!.close();
  }

  Future<Database> get temporalDataBase async {
    if (_temporalDataBase != null) await _temporalDataBase!.close();

    _temporalDataBase = await initTemporalDataBase();

    print('Opening Temporal DB');

    return _temporalDataBase!;
  }

  Future<void> closeTemporalDataBase() async {
    await _temporalDataBase!.close();
  }

  Future<void> closeDataBases() async {
    try {
      if (_database != null) {
        await _database!.close();
      }

      if (_temporalDataBase != null) {
        await _temporalDataBase!.close();
      }
    } catch (ex) {
      print(ex.toString());
    }

    print("Databases Closed");
  }

  Future<Database> initDataBase() async {
    String path = '';
    if (Platform.isIOS) {
      path = join('${await iosPath}DataBase.db');
    } else {
      path = join('${await androidPath}DataBase.db');
    }

    return await openDatabase(path, onOpen: (db) {});
  }

  Future<Database> initTemporalDataBase() async {
    String path = '';
    if (Platform.isIOS) {
      path = join('${await iosPath}Temp.db');
    } else {
      path = join('${await androidPath}Temp.db');
    }

    //Crear la base de datos temporal
    return await openDatabase(path, onOpen: (tmp) {});
  }
}



  // Future<Database> get baseAbierta async {
  //   if (_database != null && _database!.isOpen) {
  //     return _database!;
  //   }

  //   _database = await initDataBase();

  //   return _database!;
  // }

  // Future<Database> get tempAbierta async {
  //   if (_temporal != null && _temporal!.isOpen) {
  //     return _temporal!;
  //   }

  //   _temporal = await initTemporalDataBase();

  //   return _temporal!;
  // }