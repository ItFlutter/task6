import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/view/home/controller/home_controller.dart';

class CustomItemBottomNavigationBar extends GetView<HomeController> {
  final int index;
  final void Function()? onPressed;
  const CustomItemBottomNavigationBar(
      {required this.index, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 20.w,
      onPressed: onPressed,
      child: SvgPicture.asset(controller.iconsAssets[index],
          color: controller.currentPage == index
              ? AppColors.primaryColor
              : AppColors.greyColor),
    );
  }
}
