import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/view/cart/controller/cart_controller.dart';
import 'package:task_6_ecommerce/view/cart/widget/custom_row_price_cart.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_button_cart.dart';

class CustomBottomNavigationBarCart extends StatelessWidget {
  const CustomBottomNavigationBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Container(
        height: Get.height / 2.6,
        decoration: const BoxDecoration(color: AppColors.whiteColor),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
        child: Column(
          children: [
            CustomRowPriceCart(
                text: 'Subtotal', price: controller.totalPrice.toString()),
            SizedBox(
              height: 8.h,
            ),
            const CustomRowPriceCart(text: 'Delivery', price: '0'),
            SizedBox(
              height: 16.h,
            ),
            const Divider(),
            SizedBox(
              height: 16.h,
            ),
            CustomRowPriceCart(
              text: 'Total Cost',
              price: controller.totalPrice.toString(),
              priceColor: AppColors.primaryColor,
              textColor: AppColors.blackTextAndIconsColor,
            ),
            SizedBox(height: 30.h),
            SizedBox(
                height: 50.h,
                width: double.infinity,
                child: CustomButtonCart(text: 'Checkout', onPressed: () {}))
          ],
        ),
      );
    });
  }
}
