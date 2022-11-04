import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';

class RowForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String campoParaAsignar;

  const RowForm({
    Key? key,
    required this.textEditingController,
    required this.campoParaAsignar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            campoParaAsignar,
            style: TextStyles.bodyStyle(isBold: true, color: kGrayTitle),
          ),
        ),
        SizedBox(
          width: Get.width * 0.04,
        ),
        Expanded(
          child: CustomTextField(
            textEditingController: textEditingController,
            maxLines: 5,
          ),
        )
      ],
    );
  }
}
