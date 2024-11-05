import 'package:flutter/widgets.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';

class CustomRowPriceCart extends StatelessWidget {
  final String text;
  final String price;
  final Color? textColor;
  final Color? priceColor;
  const CustomRowPriceCart(
      {super.key,
      required this.text,
      required this.price,
      this.textColor,
      this.priceColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.style16.copyWith(
              color: textColor ?? AppColors.greyColor3,
              fontWeight: FontWeight.w500),
        ),
        Text(
          '\$$price',
          style: Styles.style16.copyWith(
              color: priceColor ?? AppColors.darkBlueColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins'),
        ),
      ],
    );
  }
}
