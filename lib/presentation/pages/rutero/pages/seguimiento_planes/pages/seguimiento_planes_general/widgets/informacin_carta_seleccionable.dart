import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';

class InformacionCartaSeleccionable extends StatelessWidget {
  const InformacionCartaSeleccionable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) {
        return Row(
          children: [
            Column(
              children: [
                Checkbox(
                  value: seguimientoPlanesController.isChecked.value,
                  onChanged: (value) {
                    seguimientoPlanesController.isChecked.value = value!;
                  },
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  _InfoRow(
                    tituloInformacion: "Fecha de inicio",
                    detalleInformacion: "",
                    //detallesRuteroController.selectedRutero.razonSocial ?? "",
                  ),
                  _InfoRow(
                    tituloInformacion: "Fecha compromiso",
                    detalleInformacion: "",
                    //detallesRuteroController.selectedRutero.codigo!,
                  ),
                  _InfoRow(
                    tituloInformacion: "PDV",
                    detalleInformacion: "",
                    //detallesRuteroController.selectedRutero.telefono!,
                  ),
                  _InfoRow(
                    tituloInformacion: "Responsable PDV",
                    detalleInformacion: "",
                    //detallesRuteroController.selectedRutero.barrio ?? "",
                  ),
                  _InfoRow(
                    tituloInformacion: "Descripción actividad",
                    detalleInformacion: "",
                    //detallesRuteroController.selectedRutero.email!,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String tituloInformacion;
  final String detalleInformacion;
  const _InfoRow(
      {Key? key,
      required this.tituloInformacion,
      required this.detalleInformacion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            tituloInformacion,
            style: TextStyles.bodyStyle(isBold: true, color: kGrayTitle),
          ),
        ),
        // const Spacer(),
        Expanded(
          child: Text(
            detalleInformacion,
            maxLines: 2,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.bodyStyle(color: kGraySubtitle),
          ),
        ),
      ],
    );
  }
}
