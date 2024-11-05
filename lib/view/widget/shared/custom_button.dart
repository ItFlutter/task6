import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';

class CustomButton extends StatelessWidget {
  final double? minWidth;
  final String text;
  final void Function()? onPressed;
  final bool isActive;
  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      required this.isActive,
      this.minWidth});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      onPressed: onPressed,
      color: isActive ? AppColors.primaryColor : AppColors.whiteColor,
      height: 40.h,
      shape: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
      child: Text(
        text,
        style: Styles.styleBlack12,
      ),
    );
  }
}
