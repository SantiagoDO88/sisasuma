import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/seguimiento_plan.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';

class InformacionCartaEditable extends StatelessWidget {
  final SeguimientoPlan seguimientoPlan;
  const InformacionCartaEditable({
    Key? key,
    required this.seguimientoPlan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) {
        return Column(
          children: [
            // _InfoRow(
            //   tituloInformacion: "Fecha de inicio",
            //   detalleInformacion: seguimientoPlan.fechaInicio!,
            //   //detallesRuteroController.selectedRutero.razonSocial ?? "",
            // ),
            _InfoRow(
              tituloInformacion: "PDV",
              detalleInformacion: seguimientoPlan.puntoDeVenta!,
              //detallesRuteroController.selectedRutero.telefono!,
            ),
            _InfoRow(
              tituloInformacion: "Actividad",
              detalleInformacion: seguimientoPlan.descripcionActividadDropDown!,
              //detallesRuteroController.selectedRutero.telefono!,
            ),
            _InfoRow(
              tituloInformacion: "Fecha inicio acción",
              detalleInformacion: seguimientoPlan.fechaInicioAccion!,
              //detallesRuteroController.selectedRutero.razonSocial ?? "",
            ),
            _InfoRow(
              tituloInformacion: "Responsable PDV",
              detalleInformacion: seguimientoPlan.responsablePdv!,
              //detallesRuteroController.selectedRutero.barrio ?? "",
            ),
            _InfoRow(
              tituloInformacion: "Fecha compromiso",
              detalleInformacion: seguimientoPlan.fechaCompromisoAccion!,
              //detallesRuteroController.selectedRutero.codigo!,
            ),
            _InfoRow(
              tituloInformacion: "Descripción actividad",
              detalleInformacion: seguimientoPlan.descripcionActividad!,
              //detallesRuteroController.selectedRutero.email!,
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
