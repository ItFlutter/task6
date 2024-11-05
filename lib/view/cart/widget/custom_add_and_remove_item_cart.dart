import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';

class CustomAddAndRemoveItemCart extends StatelessWidget {
  final void Function()? onTapAddButton;
  final void Function()? onTapDecreaseButton;
  final String itemCount;
  const CustomAddAndRemoveItemCart(
      {super.key,
      this.onTapAddButton,
      this.onTapDecreaseButton,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: onTapAddButton,
            child: const Icon(
              Icons.add,
              size: 16,
              color: AppColors.whiteColor,
            ),
          ),
          Text(
            itemCount,
            style: Styles.style14.copyWith(
                color: AppColors.whiteColor, fontWeight: FontWeight.w400),
          ),
          InkWell(
            onTap: onTapDecreaseButton,
            child: const Icon(
              Icons.remove,
              color: AppColors.whiteColor,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
