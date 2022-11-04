import 'dart:io';
import 'dart:async';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import 'package:uma/infraestructure/services/local/session/session_interface.dart';
import 'package:uma/infraestructure/services/local/session/session_service.dart';

import 'package:uma/infraestructure/services/constants/sql.dart';
import 'package:uma/infraestructure/services/local/sql/db_provider.dart';
import 'package:uma/infraestructure/utils/utils.dart';

class SqlUtil {
  static String? _sqlUtil;

  static final SqlUtil sqlUtil = SqlUtil._();
  SqlUtil._();

  Future<String> get createFolder async {
    _sqlUtil = await createFolderInAppDocDir(SqlConstants.folder);

    return _sqlUtil!;
  }

  final SessionInterface _sessionInterface = SessionService();

  final String _localZipFileName = 'db.zip';

  Future<String> createFolderInAppDocDir(String folderName) async {
    final Directory appDocDirFolder = await getApplicationDocumentsDirectory();

    final Directory appDocDirNewFolder =
        await appDocDirFolder.create(recursive: true);

    return appDocDirNewFolder.path;
  }

  Future<String> get folderDirectoryPath async {
    try {
      Directory appDocDirectory = await getApplicationDocumentsDirectory();

      final Directory appDocDirNewFolder =
          await appDocDirectory.create(recursive: true);

      _sqlUtil = appDocDirNewFolder.path + SqlConstants.folder;
    } catch (e) {
      print(e);
    }
    return _sqlUtil!;
  }

  Future<dynamic> downloadZip() async {
    try {
      await deleteOldDataBases();

      String directoryPath = await folderDirectoryPath;

      File zippedFile = await _downloadFile(directoryPath);

      if (zippedFile.toString().contains('db.zip')) {
        await unarchiveAndSave(zippedFile, directoryPath);

        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex.toString());
    }
  }

  Future<File> _downloadFile(String directoryPath) async {
    String url =
        '${SqlConstants.downloadSqliteFile}un=${_sessionInterface.getUser().codigoUsuario.toString()}&fe=2022-10-11@15_00&i=12345678&vr=1400';

    print(url);

    try {
      var req = await http.Client()
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 40));
      var file = File('$directoryPath$_localZipFileName');
      return await file.writeAsBytes(req.bodyBytes);
    } on TimeoutException catch (_) {
      var file = File('error');
      return file;
    } on SocketException {
      var file = File('error');
      return file;
    } on HttpException {
      var file = File('error');
      return file;
    } on FormatException {
      var file = File('error');
      return file;
    }
  }

  unarchiveAndSave(File zippedFile, String directoryPath) async {
    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);
    for (var file in archive) {
      var fileName = '$directoryPath${file.name}';
      if (file.isFile) {
        var outFile = File(fileName);
        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
    }
  }

  Future<void> _openDataBases() async {
    await DBProvider.db.database;
    await DBProvider.db.temporalDataBase;
  }

  Future<void> deleteOldDataBases() async {
    await DBProvider.db.closeDataBases();
    try {
      if (Platform.isAndroid) {
        final dataBaseDocumentDirectory =
            await androidDataBaseDocumentDirectory;
        final temporalDataBaseDocumentDirectory =
            await androidTemporalDataBaseDocumentDirectory;

        await dataBaseDocumentDirectory.delete(recursive: true);
        await temporalDataBaseDocumentDirectory.delete(recursive: true);
      }
    } catch (error) {}
  }
}

//Método antiguo para borrar las bases de datos / borraba el directorio completo, incluídas las preferencias

  // Future<void> deleteFolder() async {
  //   var release;
  //   if (Platform.isAndroid) {
  //     var androidInfo = await DeviceInfoPlugin().androidInfo;
  //     release = androidInfo.version.release;
  //     try {
  //       await DBProvider.db.closeDataBases();
  //     } catch (eror) {}
  //   }
  //   Directory appDocDirectory = await getApplicationDocumentsDirectory();
  //   print(appDocDirectory.toString());
  //   print(join('${await androidPath}DataBase.db'));
  //   if (Platform.isAndroid) {
  //     await appDocDirectory.delete(recursive: true);
  //   }
  // }