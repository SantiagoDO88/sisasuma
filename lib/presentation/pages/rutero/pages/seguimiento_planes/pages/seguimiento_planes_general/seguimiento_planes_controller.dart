import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/estado_actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/services/seguimiento_planes_service.dart';
import 'package:uma/infraestructure/rutero/seguimiento_planes/seguimiento_planes_repository_sql.dart';
import 'package:uma/infraestructure/services/local/session/session_interface.dart';
import 'package:uma/infraestructure/services/local/session/session_service.dart';
import 'package:uma/infraestructure/utils/uid_generator.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/agregar_plan/widgets/date_picker.dart';

class SeguimientoPlanesController extends GetxController {
  final SeguimientoPlanesService _seguimientoPlanesService =
      SeguimientoPlanesService(
    seguimientoPlanesInterface: SeguimientoPlanesRepositorySql(),
  );

  late SeguimientoPlan seguimientoPlan;
  late ActividadSeguimientoPlan actividadSeguimientoPlan;
  late EstadoActividadSeguimientoPlan estadoActividadSeguimientoPlan;
  static final SessionInterface _sessionInterface = SessionService();
  final RuteroWithCliente rutero = _sessionInterface.getRutero();
  //final fechaInicioAccion = TextEditingController();
  RxString fechaInicio = "".obs;
  RxString fechaInicioAccion = "".obs;
  //final fechaCompromisoAccion = TextEditingController();
  RxString fechaCompromisoAccion = "".obs;

  //final pdv = TextEditingController();
  final responsablePDV = TextEditingController();
  final descripcionActividad = TextEditingController();
  final emailController = TextEditingController();

  RxList<SeguimientoPlan> listSeguimientoPlanes = <SeguimientoPlan>[].obs;

  RxBool isChecked = false.obs;

  RxString searchText = "".obs;

  late String numDoc;

  // final RxList<String> editions =
  //     <String>["Acciones", "Editar", "Eliminar"].obs;

  // final RxString selectedEdition = 'Acciones'.obs;

  RxString selectedActivity = "Actividad".obs;
  RxList<ActividadSeguimientoPlan> listActividades =
      <ActividadSeguimientoPlan>[].obs;

  RxString selectedActivityStatus = "Estado".obs;
  RxList<EstadoActividadSeguimientoPlan> listEstadoActividades =
      <EstadoActividadSeguimientoPlan>[].obs;

  int idActividadDropDown = 0;
  int idEstadoActividadDropDown = 0;

  //final RxBool isEdit = false.obs;

  @override
  void onInit() {
    getActividadesSeguimientoPlanesList();
    getEstadoActividadesSeguimientoPlanesList();
    generateDocumentNumber();
    super.onInit();
  }

  String fechaInicioDateTimeNow() {
    DateTime? seletedFechaInicio = DateTime.now();
    return fechaInicio.value =
        DateFormat('yyyy-MM-dd').format(seletedFechaInicio);
    // if (seletedFechaInicio == null) {
    //   fechaInicio.value = "";
    // } else {

    // }
  }

  void fechaInicioAccionDatePicker(context) async {
    DateTime? seletedFechaInicioAccion = await datePicker(context);
    if (seletedFechaInicioAccion == null) {
      fechaInicioAccion.value = "";
    } else {
      fechaInicioAccion.value =
          DateFormat('yyyy-MM-dd').format(seletedFechaInicioAccion);
    }
    update();
  }

  void fechaCompromisoAccionDatePicker(context) async {
    DateTime? seletedCompromisoAccion = await datePicker(context);

    if (seletedCompromisoAccion == null) {
      fechaCompromisoAccion.value = "";
    } else {
      fechaCompromisoAccion.value = fechaCompromisoAccion.value =
          DateFormat('yyyy-MM-dd').format(seletedCompromisoAccion);
    }
    update();
  }

//  metodo para agregar plan
  void agregarSeguimientoPlan() async {
    seguimientoPlan = createSeguimientoPlanEntity();
    bool savedOnTemporal =
        await _seguimientoPlanesService.agregarSeguimientoPlan(seguimientoPlan);
    if (savedOnTemporal) {
      print("SIIIII REGISTRA NUEVO PLAN");
      print(jsonEncode(seguimientoPlan));
      await fillSeguimientoPlanesList();
      Get.toNamed(AppRoutes.firmarPlanes);
      borrarControladores();
    } else {
      //mostrar dialogo error al insertar en db temporal
      print("NOOOOO");
    }
  }

  SeguimientoPlan createSeguimientoPlanEntity() {
    // for (var element in listActividades) {
    //   if (element.descripcion == selectedActivity.value) {
    //     idActividadDropDown = element.id!;
    //   }
    // }
    // for (var element in listEstadoActividades) {
    //   if (element.descripcion == selectedActivityStatus.value) {
    //     idEstadoActividadDropDown = element.id!;
    //   }
    // }
    idActividadDropDown = listActividades
        .where((p0) => p0.descripcion == selectedActivity.value)
        .first
        .id!;

    idEstadoActividadDropDown = listEstadoActividades
        .where((p0) => p0.descripcion == selectedActivityStatus.value)
        .first
        .id!;
    return SeguimientoPlan(
      numeroDocumento: generateDocumentNumber(),
      fechaInicio: fechaInicioDateTimeNow(),
      //fechaInicio: fechaInicio.value,
      //puntoDeVenta: pdv.text,
      puntoDeVenta: rutero.nombreCliente,
      idActividadSeguimientoPlan: idActividadDropDown.toString(),
      descripcionActividadDropDown: selectedActivity.value,
      fechaInicioAccion: fechaInicioAccion.value,
      responsablePdv: responsablePDV.text,
      fechaCompromisoAccion: fechaCompromisoAccion.value,
      fechaCierre: fechaCompromisoAccion.value,
      idEstadoSeguimientoPlan: idEstadoActividadDropDown,
      descripcionEstadoActividadDropDown: selectedActivityStatus.value,
      descripcionActividad: descripcionActividad.text,
      idFotoPlan: UidGenerator.fotoUid().toString(),
    );
  }

  void setEditCard(SeguimientoPlan seguimientoPlan) {
    print("Procede a editar");

    this.seguimientoPlan = seguimientoPlan;
    fechaInicio.value = seguimientoPlan.fechaInicio!;
    //pdv.text = seguimientoPlan.puntoDeVenta!;
    rutero.nombreCliente = seguimientoPlan.puntoDeVenta!;
    idActividadDropDown =
        int.parse(seguimientoPlan.idActividadSeguimientoPlan!);
    selectedActivity.value = seguimientoPlan.descripcionActividadDropDown!;
    fechaInicioAccion.value = seguimientoPlan.fechaInicioAccion!;
    responsablePDV.text = seguimientoPlan.responsablePdv!;
    fechaCompromisoAccion.value = seguimientoPlan.fechaCompromisoAccion!;
    fechaCompromisoAccion.value = seguimientoPlan.fechaCierre!;
    idEstadoActividadDropDown = seguimientoPlan.idEstadoSeguimientoPlan!;
    selectedActivityStatus.value =
        seguimientoPlan.descripcionEstadoActividadDropDown!;
    descripcionActividad.text = seguimientoPlan.descripcionActividad!;

    Get.toNamed(AppRoutes.editarPlan);
  }

  Future<void> editarSeguimientoPlan() async {
    seguimientoPlan = editSeguimientoPlanEntity();
    bool editedOnTemporal =
        await _seguimientoPlanesService.editarSeguimientoPlan(seguimientoPlan);
    if (editedOnTemporal) {
      print("Sisas");
      borrarControladores();
      await fillSeguimientoPlanesList();
      Get.back();
      update();
    } else {
      print("nonas");
    }
  }

  SeguimientoPlan editSeguimientoPlanEntity() {
    idActividadDropDown = listActividades
        .where((p0) => p0.descripcion == selectedActivity.value)
        .first
        .id!;
    idEstadoActividadDropDown = listEstadoActividades
        .where((p0) => p0.descripcion == selectedActivityStatus.value)
        .first
        .id!;
    return SeguimientoPlan(
      numeroDocumento: seguimientoPlan.numeroDocumento,
      fechaInicio: seguimientoPlan.fechaInicio,
      //fechaInicio: fechaInicio.value,
      //puntoDeVenta: pdv.text,
      puntoDeVenta: seguimientoPlan.puntoDeVenta!,
      idActividadSeguimientoPlan: idActividadDropDown.toString(),
      descripcionActividadDropDown: selectedActivity.value,
      fechaInicioAccion: fechaInicioAccion.value,
      responsablePdv: responsablePDV.text,
      fechaCompromisoAccion: fechaCompromisoAccion.value,
      fechaCierre: fechaCompromisoAccion.value,
      idEstadoSeguimientoPlan: idEstadoActividadDropDown,
      descripcionEstadoActividadDropDown: selectedActivityStatus.value,
      descripcionActividad: descripcionActividad.text,
      idFotoPlan: UidGenerator.fotoUid().toString(),
    );
  }

  Future<void> eliminarSeguimientoPlan(seguimientoPlan) async {
    //seguimientoPlan = editSeguimientoPlanEntity();
    bool deletedOnTemporal = await _seguimientoPlanesService
        .eliminarSeguimientoPlan(seguimientoPlan);
    if (deletedOnTemporal) {
      print("Eliminado");
      await fillSeguimientoPlanesList();
      update();
    } else {
      print("No eliminado");
    }
  }

  Future<void> fillSeguimientoPlanesList() async {
    listSeguimientoPlanes.value =
        await _seguimientoPlanesService.obtenerSeguimientoPlanes();
    print(jsonEncode(listSeguimientoPlanes));
  }

  void borrarControladores() {
    fechaInicio.value = "";
    fechaInicioAccion.value = "";
    fechaCompromisoAccion.value = "";
    selectedActivity.value = "Actividad";
    selectedActivityStatus.value = "Estado";
    //pdv.clear();
    responsablePDV.clear();
    descripcionActividad.clear();
    imageSelected = null;
    update();
  }

  // void dropDown(Object value) {
  //   selectedEdition.value = value.toString();
  //   update();
  // }

  Future<List<ActividadSeguimientoPlan>>
      getActividadesSeguimientoPlanesList() async {
    listActividades.value =
        await _seguimientoPlanesService.obtenerActividadesSeguimientoPlanes();
    listActividades.insert(0,
        ActividadSeguimientoPlan(descripcion: "Actividad", id: 0, activo: 1));
    return listActividades;
  }

  void activitySelection(Object value) {
    selectedActivity.value = value.toString();
    update();
  }

  Future<List<EstadoActividadSeguimientoPlan>>
      getEstadoActividadesSeguimientoPlanesList() async {
    listEstadoActividades.value = await _seguimientoPlanesService
        .obtenerEstadoActividadSeguimientoPlanes();
    listEstadoActividades.insert(
        0,
        EstadoActividadSeguimientoPlan(
            descripcion: "Estado", id: 0, color: "#FFD700", activo: 0));
    return listEstadoActividades;
  }

  void activityStateSelection(Object value) {
    selectedActivityStatus.value = value.toString();
    update();
  }

  String generateDocumentNumber() {
    //ateTime dateTime = DateTime.now();
    String numDoc;
    String date = DateFormat("yyyyMMddHmss").format(DateTime.now()).toString();
    //String varibleNumDoc =
    //    "${dateTime.year.toString()}${dateTime.month.toString()}${dateTime.day.toString()}${dateTime.hour.toString()}${dateTime.minute.toString()}${dateTime.second.toString()}";
    numDoc = date;
    print(numDoc);
    return numDoc;
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(
              "Cámara",
              style: TextStyles.titleStyle(),
            ),
            onTap: () {
              pickGalleryAndCameraImage(ImageSource.camera);
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.image_outlined),
            title: Text(
              "Galería",
              style: TextStyles.titleStyle(),
            ),
            onTap: () {
              pickGalleryAndCameraImage(ImageSource.gallery);
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  File? imageSelected;

  Future pickGalleryAndCameraImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      final imageTemp = File(image.path);
      imageSelected = imageTemp;

      String basename = basenameWithoutExtension(imageTemp.path);
      Uint8List imageSelectedAsBytes = imageSelected!.readAsBytesSync();

      print("sisas imagen");
      print(imageSelectedAsBytes);
    } on PlatformException catch (e) {
      print("Imagen no seleccionada $e");
    }
    update();
  }
}
