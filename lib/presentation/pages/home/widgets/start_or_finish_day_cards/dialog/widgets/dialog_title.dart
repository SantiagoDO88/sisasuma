import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/pages/home/home_controller.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/helpers/pretty_strings.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "¡Hola ${PrettyStrings.getPrettyName(homeController.user.nombre).toTitleCase()}!",
            style: TextStyles.titleStyle2(),
          ),
          Text(
            PrettyStrings.getPrettyDate(DateTime.now()),
            style: TextStyles.titleStyle(isBold: true),
          ),
        ],
      ),
    );
  }
}
