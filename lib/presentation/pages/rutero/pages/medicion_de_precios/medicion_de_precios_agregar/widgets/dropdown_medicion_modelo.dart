import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/domain/rutero/medicion_precio/models/modelo.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/medicion_precios_agregar_controller.dart';

class DropdownMedicionModelo extends StatelessWidget {
  const DropdownMedicionModelo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MedicionPreciosAgregarController>(
        builder: (medicionPreciosController) {
      return Material(
        elevation: 2,
        color: kPrimaryRed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05, vertical: Get.height * 0.004),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                isExpanded: true,
                elevation: 3,
                iconDisabledColor: kPrimaryWhite,
                iconEnabledColor: kPrimaryWhite,
                icon: Icon(Icons.arrow_drop_down_rounded),
                dropdownColor: kPrimaryRed,
                borderRadius: BorderRadius.circular(20),
                hint: Text(
                  "Modelo",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.bodyStyle(color: kPrimaryWhite),
                ),
                items: medicionPreciosController.listModelos
                    .map<DropdownMenuItem<Modelo>>((Modelo item) =>
                        DropdownMenuItem<Modelo>(
                          value: item,
                          child: Center(
                              child: Text(
                            item.descripcion!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.bodyStyle(color: kPrimaryWhite),
                          )),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  medicionPreciosController
                      .dropdownChangeModelo(newValue as Modelo);
                },
                value: medicionPreciosController.selectValueModelo.value),
          ),
        ),
      );
    });
  }
}

// Obx(
//                       () => DropdownButton(
//                           isExpanded: true,
//                           elevation: 3,
//                           iconDisabledColor: kPrimaryWhite,
//                           iconEnabledColor: kPrimaryWhite,
//                           icon: Icon(Icons.arrow_drop_down_rounded),
//                           dropdownColor: kPrimaryRed,
//                           borderRadius: BorderRadius.circular(20),
//                           hint: Text(
//                             "Modelo",
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyles.bodyStyle(color: kPrimaryWhite),
//                           ),
//                           items: snapshot.data
//                               .map<DropdownMenuItem<Modelo>>(
//                                   (Modelo item) => DropdownMenuItem<Modelo>(
//                                         value: item,
//                                         child: Center(
//                                             child: Text(
//                                           item.descripcion!,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: TextStyles.bodyStyle(
//                                               color: kPrimaryWhite),
//                                         )),
//                                       ))
//                               .toList(),
//                           onChanged: (newValue) {
//                             medicionPreciosController
//                                 .dropdownChangeModelo(newValue as Modelo);
//                           },
//                           value: medicionPreciosController
//                               .selectValueModelo.value),
//                     )),
