import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';

class InformacionCartaEvents extends StatelessWidget {
  final MedicionPrecio medicionPrecio;
  const InformacionCartaEvents({Key? key, required this.medicionPrecio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) {
        return Column(
          children: [
            _InfoRow(
              tituloInformacion: "Modelo",
              detalleInformacion: medicionPrecio.descripcion??"NULL",
            ),
            _InfoRow(
              tituloInformacion: "Marca",
              detalleInformacion: medicionPrecio.descripcionMarca??"NULL",
            ),
            _InfoRow(
              tituloInformacion: "Precio",
              detalleInformacion: medicionPrecio.precio.toString(),
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
