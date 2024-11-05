import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';

class CustomCartItems extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  const CustomCartItems(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(7.w),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(
            productImage,
          ),
        ),
        title: Text(
          productName,
          style: Styles.style13,
        ),
        subtitle: Text(
          '\$$productPrice',
          style: Styles.styleBlack14.copyWith(color: AppColors.darkBlueColor),
        ),
      ),
    );
  }
}
