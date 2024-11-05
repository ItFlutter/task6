import 'package:flutter/material.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';

class CustomSearchTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function()? onPressedIconButton;
  const CustomSearchTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.onPressedIconButton});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(height: 0.9),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Styles.style12,
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.greyColor,
            ),
            onPressed: onPressedIconButton,
          ),
          fillColor: AppColors.whiteColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none)),
    );
  }
}
