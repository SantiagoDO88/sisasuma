import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get iosPath async {
  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  return '${appDocDirectory.path}/';
}

Future<Directory> get iosDataBaseDocumentDirectory async {
  return Directory(join('${await iosPath}DataBase.db'));
}

Future<Directory> get iosTemporalDataBaseDocumentDirectory async {
  return Directory(join('${await iosPath}Temp.db'));
}

Future<String> get androidPath async {
  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  return '${appDocDirectory.path}/';
}

Future<Directory> get androidDataBaseDocumentDirectory async {
  return Directory(join('${await androidPath}DataBase.db'));
}

Future<Directory> get androidTemporalDataBaseDocumentDirectory async {
  return Directory(join('${await androidPath}Temp.db'));
}
