import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:uma/infraestructure/services/constants/apis.dart';
import 'package:uma/infraestructure/services/local/sql/db_provider.dart';

class Services {
  static Future<String> sincronizarDB(String archivo) async {
    var respuesta = "";
    // final url = Uri.parse(
    //     "${ApiConstants.registerInfo} un=10007176 & fecha= 20221031 & pv= 676322");
    // final res = await http.post(url,
    //     headers: {'Content-Type': 'application/json', 'zip': archivo});

    String fecha = DateFormat('yyyyMMddkkmm').format(DateTime.now());

    try {
      final url = Uri.parse(
          "${ApiConstants.registerInfo}un=10007176&fecha=$fecha&pv=676322");
      print(url);
      var request = http.MultipartRequest('POST', url);
      print("${archivo}Temp.zip");
      final file = await http.MultipartFile.fromPath(
          'zip', '${archivo}Temp.zip',
          contentType: MediaType('application', 'x-tar'));

      request.files.add(file);
      request.headers['content-type'] =
        'multipart/form-data; boundary=O.VhPut0067inOIWt0._Pt8RaPKiPHWU0oNOtWz-xTY1iY.3WKN';

      http.StreamedResponse response =
          await request.send().timeout(const Duration(seconds: 60));
      response.stream.transform(utf8.decoder).listen((value) async {
        respuesta = value;
        print('respuesta server $respuesta');
        if (respuesta.toUpperCase() == 'O' ||
            respuesta.toUpperCase() == 'K' ||
            respuesta.toUpperCase() == 'OK') {
          //DBProvider.db.eliminarBasesDeDatosTemporal();
          respuesta = 'Registro en servidor';
        } else {
          respuesta = "Error";
          //respuestaServer = value;
        }
      });
    } on TimeoutException catch (_) {
      respuesta = 'Tiempo de espera alcanzado';
    } on SocketException {
      respuesta = 'Sin internet  o falla de servidor';
    } on HttpException {
      respuesta = 'No se encontro esa peticion';
    } on FormatException {
      respuesta = 'Formato erroneo';
    }
    print(respuesta);
    return respuesta;
  }

  /// UTILL
  // Future<String> enviarInformacionPendiente(String usuario, context2) async {

  //   final Directory _appDocDirFolder;

  //   String path = '';
  //   if (Platform.isIOS) {
  //     path = join(await iosPaht);
  //   } else {
  //     path = join(await androidPaht);
  //   }
  //   _appDocDirFolder = new Directory(path);

  //   comprimirArchivo(_appDocDirFolder);
  //   String respuesta = '';
  //   String respuestaServer = '';
  //   if (_appUtil == null) {
  //     _appUtil = _appDocDirFolder.path;
  //   }

  //   DateTime now = new DateTime.now();
  //   String fecha = DateFormat('yyyyMMddkkmm').format(now);

  //   final url = Uri.parse(Constantes().urlBaseEnvio +
  //       "RegistrarPedidoFlutter.aspx?usr=$usuario&ext=zip&fm=$fecha");
  //   print(url);
  //   var request = http.MultipartRequest('POST', url);

  //   //EDISON
  //   final file = await http.MultipartFile.fromPath(
  //       'file', _appUtil! + 'Temp.zip',
  //       contentType: MediaType('application', 'zip'));

  //   request.files.add(file);
  //   request.headers['content-type'] =
  //       'multipart/form-data; boundary=O.VhPut0067inOIWt0._Pt8RaPKiPHWU0oNOtWz-xTY1iY.3WKN';

  //   try {
  //     http.StreamedResponse response =
  //         await request.send().timeout(const Duration(seconds: 60));
  //     response.stream.transform(utf8.decoder).listen((value) async {
  //       respuesta = value;
  //       print('respuesta server $respuesta');
  //       if (respuesta.toUpperCase() == 'O' ||
  //           respuesta.toUpperCase() == 'K' ||
  //           respuesta.toUpperCase() == 'OK') {
  //         DBProvider.db.eliminarBasesDeDatosTemporal();
  //         respuesta = 'Registro en servidor';
  //       } else {
  //         respuesta = "Error";
  //         respuestaServer = value;
  //       }
  //     });
  //   } on TimeoutException catch (_) {
  //     respuesta = 'Tiempo de espera alcanzado';
  //   } on SocketException {
  //     respuesta = 'Sin internet  o falla de servidor';
  //   } on HttpException {
  //     respuesta = 'No se encontro esa peticion';
  //   } on FormatException {
  //     respuesta = 'Formato erroneo';
  //   }

  //   await pr.hide();

  //   return respuesta;
  // }
}
