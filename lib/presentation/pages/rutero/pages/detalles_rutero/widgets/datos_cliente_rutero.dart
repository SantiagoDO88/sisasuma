import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/detalles_rutero_controller.dart';

class DatosClienteRutero extends StatelessWidget {
  const DatosClienteRutero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesRuteroController>(
      builder: (detallesRuteroController) {
        return Column(
          children: [
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: Get.height * 0.01),
            Column(
              children: [
                Text(
                  "CC ${detallesRuteroController.selectedRutero.documento!}",
                  style: TextStyles.titleStyle(color: kGraySubtitle),
                ),
                Text(
                  detallesRuteroController.selectedRutero.direccion!,
                  style: TextStyles.bodyStyle(color: kGrayTitle),
                )
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            _InfoRow(
              tituloInformacion: "Razon Social",
              detalleInformacion:
                  detallesRuteroController.selectedRutero.razonSocial ?? "",
            ),
            _InfoRow(
              tituloInformacion: "Nit",
              detalleInformacion:
                  detallesRuteroController.selectedRutero.codigo!,
            ),
            _InfoRow(
              tituloInformacion: "Teléfono",
              detalleInformacion:
                  detallesRuteroController.selectedRutero.telefono!,
            ),
            _InfoRow(
              tituloInformacion: "Barrio",
              detalleInformacion:
                  detallesRuteroController.selectedRutero.barrio ?? "",
            ),
            _InfoRow(
              tituloInformacion: "Email",
              detalleInformacion:
                  detallesRuteroController.selectedRutero.email!,
            ),
            _InfoRow(
              tituloInformacion: "Canal",
              detalleInformacion:
                  detallesRuteroController.selectedRutero.canal ?? "",
            ),
            _InfoRow(
              tituloInformacion: "Frecuencia",
              detalleInformacion:
                  detallesRuteroController.selectedRutero.frecuencia ?? "",
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
