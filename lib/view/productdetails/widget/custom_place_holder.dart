import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';

class CustomPlaceHolder extends StatelessWidget {
  final String text;
  const CustomPlaceHolder({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 45.w),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        text,
        style: Styles.style14.copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
