import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';

class CustomCircleWithOutDot extends StatelessWidget {
  final void Function()? onTap;
  final String assetName;
  final double? radius;
  final Color? backgroundColor;
  final Color? color;
  const CustomCircleWithOutDot(
      {super.key,
      this.onTap,
      required this.assetName,
      this.color,
      this.backgroundColor,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
        child: SvgPicture.asset(
          assetName,
          height: 24.h,
          color: color ?? AppColors.blackTextAndIconsColor,
        ),
      ),
    );
  }
}
