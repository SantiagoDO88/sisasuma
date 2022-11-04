import 'package:flutter/material.dart';
import 'package:uma/presentation/common/style/style.dart';

class CustomSearchTextField extends StatelessWidget {
  final String? hint;
  final Function(String) onSearch;
  final TextEditingController searchController = TextEditingController();
  final bool border;
  final Widget? suffixIcon;

  CustomSearchTextField({
    Key? key,
    required this.onSearch,
    this.hint,
    this.border = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyles.bodyStyle(),
      onChanged: (value) {
        searchController.text = value;
        onSearch(value);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: kPrimaryWhite,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hint,
        hintStyle: TextStyles.bodyStyle(color: kGrayHints),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 14,
        ),
      ),
    );
  }
}
