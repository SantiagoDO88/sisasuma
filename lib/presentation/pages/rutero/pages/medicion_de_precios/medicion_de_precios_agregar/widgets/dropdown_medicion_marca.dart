import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/domain/rutero/medicion_precio/models/marca.dart';
import 'package:uma/domain/rutero/medicion_precio/models/modelo.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/medicion_precios_agregar_controller.dart';

class DropdownMedicionMarca extends StatelessWidget {
  const DropdownMedicionMarca({
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
                  "Marca",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.bodyStyle(color: kPrimaryWhite),
                ),
                items: medicionPreciosController.listMarcas.value
                    .map<DropdownMenuItem<Marca>>(
                      (Marca item) => DropdownMenuItem<Marca>(
                        value: item,
                        child: Center(
                          child: Text(
                            item.descripcion!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.bodyStyle(color: kPrimaryWhite),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  medicionPreciosController
                      .dropdownChangeMarca(newValue as Marca);
                },
                value: medicionPreciosController.selectValueMarca.value),
          )),
        );
    });
  }
}
