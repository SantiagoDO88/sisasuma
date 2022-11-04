import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/custom_card.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/widgets/row_container_with_text.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/widgets/row_form.dart';
import 'package:uma/presentation/pages/rutero/widgets/custom_drop_down.dart';

class EditarPlanPageForm extends StatelessWidget {
  const EditarPlanPageForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) {
        return Column(
          //shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          children: [
            // GestureDetector(
            //   child: RowContainerWithText(
            //     campoParaAsignar: "Fecha de inicio",
            //     text: seguimientoPlanesController.fechaInicio.value,
            //   ),
            //   onTap: () {
            //     seguimientoPlanesController.fechaInicioDatePicker(context);
            //   },
            // ),
            // SizedBox(
            //   height: Get.height * 0.01,
            // ),
            // RowForm(
            //   campoParaAsignar: "PDV",
            //   textEditingController: seguimientoPlanesController.pdv,
            // ),
            RowContainerWithText(
              campoParaAsignar: "PDV",
              text: seguimientoPlanesController.rutero.nombreCliente!,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Activad",
                    style:
                        TextStyles.bodyStyle(isBold: true, color: kGrayTitle),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.04,
                ),
                Expanded(
                  child: CustomDropDown(
                    isRed: true,
                    color: kPrimaryRed,
                    elementsColor: kPrimaryWhite,
                    dropDownColor: kPrimaryRed,
                    items: seguimientoPlanesController.listActividades
                        .map((element) => element.descripcion!)
                        .toList(),
                    value: seguimientoPlanesController.selectedActivity.value,
                    onChanged: (value) {
                      seguimientoPlanesController.activitySelection(value);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            GestureDetector(
              child: RowContainerWithText(
                campoParaAsignar: "Fecha de inicio acción",
                text: seguimientoPlanesController.fechaInicioAccion.value,
              ),
              onTap: () {
                seguimientoPlanesController
                    .fechaInicioAccionDatePicker(context);
              },
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            RowForm(
              campoParaAsignar: "Responsable PDV",
              textEditingController: seguimientoPlanesController.responsablePDV,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            GestureDetector(
              child: RowContainerWithText(
                campoParaAsignar: "Fecha compromiso acción",
                text: seguimientoPlanesController.fechaCompromisoAccion.value,
              ),
              onTap: () {
                seguimientoPlanesController
                    .fechaCompromisoAccionDatePicker(context);
              },
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Estado actividad",
                    style:
                        TextStyles.bodyStyle(isBold: true, color: kGrayTitle),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.04,
                ),
                Expanded(
                  child: CustomDropDown(
                    isRed: true,
                    color: kPrimaryRed,
                    elementsColor: kPrimaryWhite,
                    dropDownColor: kPrimaryRed,
                    items: seguimientoPlanesController.listEstadoActividades
                        .map((element) => element.descripcion!)
                        .toList(),
                    value: seguimientoPlanesController
                        .selectedActivityStatus.value,
                    onChanged: (value) {
                      seguimientoPlanesController.activityStateSelection(value);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            RowForm(
              campoParaAsignar: "Descripción activdad",
              textEditingController:
                  seguimientoPlanesController.descripcionActividad,
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            seguimientoPlanesController.imageSelected != null
                ? InkWell(
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onTap: () {
                      seguimientoPlanesController.showImageSource(context);
                    },
                    child: SizedBox(
                      height: Get.height * 0.25,
                      child: CustomCard(
                        body: Image.file(
                            seguimientoPlanesController.imageSelected!),
                      ),
                    ),
                  )
                : InkWell(
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onTap: () {
                      seguimientoPlanesController.showImageSource(context);
                    },
                    child: SizedBox(
                      height: Get.height * 0.25,
                      child: CustomCard(
                        body: const Image(
                          image: AssetImage('assets/icons/add_photo.png'),
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            const Spacer(),
            SizedBox(
              width: Get.width,
              child: CustomButton(
                placeHolder: "Editar",
                onPressed: () {
                  seguimientoPlanesController.editarSeguimientoPlan();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
