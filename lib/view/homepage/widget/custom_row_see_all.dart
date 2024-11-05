import 'package:flutter/widgets.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';

class CustomRowSeeAll extends StatelessWidget {
  final String text;
  const CustomRowSeeAll({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.style16.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          'See all',
          style: Styles.style12.copyWith(color: AppColors.primaryColor),
        )
      ],
    );
  }
}
