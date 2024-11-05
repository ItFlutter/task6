import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';
import 'package:task_6_ecommerce/view/productdetails/controller/productdetails_controller.dart';

class CustomButtonCart extends GetView<ProductDetailsController> {
  final String text;
  final String? assetName;
  final void Function()? onPressed;

  const CustomButtonCart(
      {required this.text, this.assetName, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        text,
        style: Styles.style14.copyWith(color: AppColors.whiteColor),
      ),
      icon: assetName == null ? null : SvgPicture.asset(assetName ?? ""),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 45.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: AppColors.primaryColor),
    );
  }
}
