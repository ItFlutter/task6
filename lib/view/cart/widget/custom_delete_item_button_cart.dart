import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';

class CustomDeleteItemButtonCart extends StatelessWidget {
  final void Function()? onTap;
  const CustomDeleteItemButtonCart({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.redColor1),
        child: SvgPicture.asset(AppImageAsset.deleteIcon),
      ),
    );
  }
}
