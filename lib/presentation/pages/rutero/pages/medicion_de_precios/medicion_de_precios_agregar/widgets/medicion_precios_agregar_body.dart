import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/widgets/card_info.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/medicion_precios_agregar_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/widgets/dropdown_medicion_marca.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/widgets/dropdown_medicion_modelo.dart';

class MedicionPreciosAgregarBody extends StatelessWidget {
  const MedicionPreciosAgregarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MedicionPreciosAgregarController>(
        builder: (medicionPreciosController) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.02, horizontal: Get.height * 0.025),
        child: Column(
          children: [
            const CardInfo(),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.04, vertical: Get.height * 0.025),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Marca",
                        style: TextStyles.bodyStyle(isBold: true),
                      ),
                      trailing: SizedBox(
                          width: Get.width * 0.45,
                          child: DropdownMedicionMarca()),
                    ),
                    ListTile(
                      title: Text("Modelo",
                          style: TextStyles.bodyStyle(isBold: true)),
                      trailing: SizedBox(
                          width: Get.width * 0.45,
                          child: 
                          DropdownMedicionModelo()
                          //medicionPreciosController.selectValueMarca.value!=null?
                          //  DropdownMedicionModelo():
                          //  Container()
                          ),
                    ),
                    ListTile(
                      title: Text("Precio",
                          style: TextStyles.bodyStyle(isBold: true)),
                      trailing: SizedBox(
                        width: Get.width * 0.45,
                        child: CustomTextField(
                          textEditingController:
                              medicionPreciosController.precioController,
                          hint: "Precio",
                          numeric: true
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: Get.width,
              child: 
              medicionPreciosController.jsonMedicionEdit.value.isEmpty?
              
              CustomButton(
                placeHolder: 'Agregar Medicion',
                onPressed: () => {
                  medicionPreciosController.saveMedicion()
                  //Get.toNamed(AppRoutes.medicionPreciosFinalizar)
                },
              ):
              CustomButton(
                placeHolder: 'Editar Medicion',
                onPressed: () => {
                  medicionPreciosController.editarMedicion()
                  //Get.toNamed(AppRoutes.medicionPreciosFinalizar)
                },
              )
            ),
          ],
        ),
      );
    });
  }
}
