import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomFloatingActionButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: AppColors.primaryColor,
      onPressed: onPressed,
      child: SvgPicture.asset(AppImageAsset.cartIcon),
    );
  }
}
