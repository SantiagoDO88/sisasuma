import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_finalizar/medicion_precios_finalizar_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_finalizar/widgets/informacion_carta_events.dart';

class CardEvents extends StatelessWidget {
  const CardEvents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MedicionPreciosFinalizarController>(
        builder: (medicionPreciosController) {
      return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: medicionPreciosController.listMedicionPrecio.length,
        itemBuilder: (BuildContext context, int index) {
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
                                top: Get.height * 0.01,
                                bottom: Get.height * 0.01),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Medicion # 4584856",
                                style: TextStyles.titleStyle(
                                  isBold: true,
                                  color: kPrimaryRed,
                                ),
                              ),
                            )),
                        const Divider(
                          thickness: 1,
                        ),
                        InformacionCartaEvents(
                            medicionPrecio: medicionPreciosController
                                .listMedicionPrecio.value[index]!),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    color: kPrimaryRed,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.018,
                        vertical: Get.height * 0.02),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => medicionPreciosController
                              .deleteMedicionPrecio(medicionPreciosController
                                  .listMedicionPrecio.value[index]!),
                          child: Image(
                            color: kPrimaryWhite,
                            image:
                                const AssetImage('assets/icons/eliminar.png'),
                            height: Get.height * 0.030,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.014,
                        ),
                        InkWell(
                          onTap: () => medicionPreciosController
                              .editMedicionPrecio(medicionPreciosController
                                  .listMedicionPrecio.value[index]!),
                          child: Image(
                            color: kPrimaryWhite,
                            image: const AssetImage('assets/icons/editar.png'),
                            height: Get.height * 0.030,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      );
    });
  }
}
