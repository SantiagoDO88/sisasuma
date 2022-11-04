import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/actividad_seguimiento_plan.dart';
import 'package:uma/domain/rutero/seguimiento_planes/models/seguimiento_plan.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/widgets/informacion_carta_editable.dart';

class CartaEditable extends StatelessWidget {
  final SeguimientoPlan seguimientoPlan;
  const CartaEditable({
    super.key,
    required this.seguimientoPlan,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) {
        return Row(
          children: [
            Expanded(
              child: Card(
                margin: const EdgeInsets.fromLTRB(4.0, 4.0, 0, 4.0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5,
                color: kPrimaryWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.040,
                    vertical: Get.height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: Get.height * 0.01, bottom: Get.height * 0.01),
                        child: Row(
                          children: [
                            Text(
                              "Plan # ${seguimientoPlan.numeroDocumento}",
                              style: TextStyles.titleStyle(
                                isBold: true,
                                color: kPrimaryRed,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Estado",
                                    style: TextStyles.bodyStyle(
                                            color: kGraySubtitle)
                                        .copyWith(
                                      fontSize: 13 / Get.textScaleFactor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  if (seguimientoPlan.idEstadoSeguimientoPlan ==
                                      1)
                                    Slider(
                                        max: 1,
                                        min: 0,
                                        onChanged: (value) {},
                                        value: double.parse(
                                            "${seguimientoPlan.idEstadoSeguimientoPlan}"),
                                        activeColor: kPrimaryYellow),
                                  if (seguimientoPlan.idEstadoSeguimientoPlan ==
                                      2)
                                    Slider(
                                        max: 2,
                                        min: 1,
                                        onChanged: (value) {},
                                        value: double.parse(
                                            "${seguimientoPlan.idEstadoSeguimientoPlan}"),
                                        activeColor: kPrimaryRed),
                                  if (seguimientoPlan.idEstadoSeguimientoPlan ==
                                      3)
                                    Slider(
                                        max: 3,
                                        min: 1,
                                        onChanged: (value) {},
                                        value: double.parse(
                                            "${seguimientoPlan.idEstadoSeguimientoPlan}"),
                                        activeColor: kPrimaryGreen),
                                  if (seguimientoPlan.idEstadoSeguimientoPlan ==
                                      4)
                                    Slider(
                                        max: 4,
                                        min: 1,
                                        onChanged: (value) {},
                                        value: double.parse(
                                            "${seguimientoPlan.idEstadoSeguimientoPlan}"),
                                        activeColor: kPrimaryGrey),

                                  // Slider(
                                  //   max: 4,
                                  //   min: 0,
                                  //   value: double.parse(
                                  //       "${seguimientoPlan.idEstadoSeguimientoPlan}"),
                                  //   onChanged: (value) {},
                                  //   activeColor: (seguimientoPlan
                                  //               .idEstadoSeguimientoPlan ==
                                  //           1)
                                  //       ? Colors.yellow //Colors.red
                                  //       : (seguimientoPlan
                                  //                   .idEstadoSeguimientoPlan ==
                                  //               2)
                                  //           ? Colors.red
                                  //           : (seguimientoPlan
                                  //                       .idEstadoSeguimientoPlan ==
                                  //                   4)
                                  //               ? Colors.grey
                                  //               : Colors.green,
                                  //   inactiveColor: Colors.grey[300],
                                  // ),
                                  SizedBox(
                                    height: Get.height * 0.001,
                                  ),
                                  Text(
                                    "${seguimientoPlan.descripcionEstadoActividadDropDown}",
                                    style: TextStyles.bodyStyle(
                                            color: kGraySubtitle, isBold: true)
                                        .copyWith(
                                      fontSize: 13 / Get.textScaleFactor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      InformacionCartaEditable(
                        seguimientoPlan: seguimientoPlan,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: kPrimaryRed,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.018, vertical: Get.height * 0.02),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        seguimientoPlanesController
                            .eliminarSeguimientoPlan(seguimientoPlan);
                      },
                      child: Image(
                        color: kPrimaryWhite,
                        image: const AssetImage('assets/icons/eliminar.png'),
                        height: Get.height * 0.030,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.014,
                    ),
                    InkWell(
                      onTap: () => seguimientoPlanesController.setEditCard(
                        seguimientoPlan,
                      ),
                      child: Image(
                        color: kPrimaryWhite,
                        image: const AssetImage('assets/icons/editar.png'),
                        height: Get.height * 0.030,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
