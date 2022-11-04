import 'package:get/get.dart';
import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';

class DetallesRuteroController extends GetxController {
  late RuteroWithCliente selectedRutero;

  void setInitials({
    required RuteroWithCliente selectedRutero,
  }) {
    this.selectedRutero = selectedRutero;
  }
}
