import 'package:flutter/material.dart';
import 'package:uma/presentation/common/style/style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? hint;
  final double contentPadding;
  final int maxLenght;
  final bool numeric;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? filled;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    required this.textEditingController,
    this.hint,
    this.contentPadding = 14,
    this.maxLenght = 0,
    this.numeric = false,
    this.prefixIcon,
    this.suffixIcon,
    this.filled,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: maxLines,
      maxLength: maxLenght == 0 ? null : maxLenght,
      controller: textEditingController,
      style: TextStyles.bodyStyle(),
      keyboardType: numeric ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        filled: filled,
        fillColor: kPrimaryWhite,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hint,
        hintStyle: TextStyles.bodyStyle(color: kGrayHints),
        contentPadding: EdgeInsets.symmetric(
          vertical: contentPadding,
          horizontal: contentPadding,
        ),
      ),
    );
  }
}
