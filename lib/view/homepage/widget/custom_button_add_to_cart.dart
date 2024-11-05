import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';

class CustomButtonAddToCart extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  final Color? color;
  final double? size;
  const CustomButtonAddToCart(
      {super.key, this.onTap, this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                )),
            child: Icon(
              icon,
              size: size,
              color: AppColors.whiteColor,
            )));
  }
}
