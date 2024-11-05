import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_6_ecommerce/bindings/initial_bindings.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';

class CustomCircleIconAppBar extends StatelessWidget {
  final void Function()? onTap;
  final String assetName;
  final bool? isNew;
  final Color? color;
  const CustomCircleIconAppBar(
      {super.key, this.onTap, required this.assetName, this.isNew, this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            // radius: 11,
            backgroundColor: color ?? AppColors.whiteColor,
            child: SvgPicture.asset(
              assetName,
              color: AppColors.blackTextAndIconsColor,
            ),
          ),
        ),
        isNew != null
            ? const CircleAvatar(
                backgroundColor: AppColors.redColor,
                radius: 5,
              )
            : Container(),
      ],
    );
  }
}
