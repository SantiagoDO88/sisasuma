import 'package:flutter/material.dart';
import 'package:uma/presentation/common/style/style.dart';

class CustomTextFieldDialog extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? hint;
  final double contentPadding;
  final int maxLenght;
  final bool numeric;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool enabled;

  const CustomTextFieldDialog({
    Key? key,
    required this.textEditingController,
    this.hint,
    this.contentPadding = 16,
    this.maxLenght = 0,
    this.numeric = false,
    this.prefixIcon,
    this.readOnly = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      readOnly: readOnly,
      textAlign: TextAlign.center,
      maxLength: maxLenght == 0 ? null : maxLenght,
      controller: textEditingController,
      style: TextStyles.bodyStyle(),
      keyboardType: numeric ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: const UnderlineInputBorder(
            borderSide: BorderSide()),
        hintText: hint,
        hintStyle: TextStyles.bodyStyle(color: kGrayHints),
        // contentPadding: EdgeInsets.symmetric(
        //     vertical: contentPadding),
      ),
    );
  }
}
