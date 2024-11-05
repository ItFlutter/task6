import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';

class CustomLogoAppBar extends StatelessWidget {
  final String text;
  const CustomLogoAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Positioned(
            child: Image.asset(
          AppImageAsset.textEffect,
          fit: BoxFit.scaleDown,
        )),
        Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Text(
            text,
            style: Styles.style32,
          ),
        ),
      ],
    );
  }
}
