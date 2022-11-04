import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio.dart';
import 'package:uma/domain/rutero/medicion_precio/services/medicion_precio_service.dart';
import 'package:uma/infraestructure/rutero/medicion_precios/medicion_precios_repository_sql.dart';
import 'package:uma/infraestructure/services/api/services.dart';
import 'package:uma/infraestructure/services/local/sql/db_provider.dart';
import 'package:uma/infraestructure/utils/utils.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/detalles_rutero_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/medicion_precios_agregar_controller.dart';

class MedicionPreciosFinalizarController extends GetxController {
  final MedicionPrecioService _medicionPrecioService = MedicionPrecioService(
      MedicionPrecioInterface: MedicionPreciosRepositorySql());

  final DetallesRuteroController _detallesRuteroController = Get.find();

  RxList<MedicionPrecio?> listMedicionPrecio = <MedicionPrecio>[].obs;

  final _storage = GetStorage();

  @override
  void onInit() {
    _storage.write('medicionEdit', null);
    getListMedicionesPrecios();
    super.onInit();
  }

  Future<List<MedicionPrecio?>> getListMedicionesPrecios() async {
    listMedicionPrecio.value =
        await _medicionPrecioService.getListMedicionesPreciosTemp(
            _detallesRuteroController.selectedRutero.codigo!);
    return listMedicionPrecio;
  }

  void deleteMedicionPrecio(MedicionPrecio medicionPrecio) async {
    await _medicionPrecioService.deleteMedicionPrecio(medicionPrecio);
    getListMedicionesPrecios();
  }

  void editMedicionPrecio(MedicionPrecio medicionPrecio) async {
    _storage.write('medicionEdit', medicionPrecio.toJson());
    Get.offAndToNamed(AppRoutes.medicionPreciosAgregar);
  }

  void enviarDB() async {
    try {
      final temporal = await DBProvider.db.temporalDataBase;

      String path = '';
      if (Platform.isIOS) {
        path = join(await iosPath);
      } else {
        path = join(await androidPath);
      }

      final Directory urlFolderTemporal = new Directory(path);

      comprimirArchivo(urlFolderTemporal);

      Services.sincronizarDB(urlFolderTemporal.path);

      //encoder.close();

    } catch (error) {
      print("fallo qui" + error.toString());
    }
  }

  comprimirArchivo(_appDocDirFolder) {
    // Zip a directory to out.zip using the zipDirectory convenience method
    var encoder = ZipFileEncoder();

    encoder.create(_appDocDirFolder.path + 'Temp.zip');
    encoder.addFile(File(_appDocDirFolder.path + 'Temp.db'));
    encoder.close();
  }
}
