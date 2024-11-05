import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';
import 'package:task_6_ecommerce/view/productdetails/controller/productdetails_controller.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_button_cart.dart';
import 'package:task_6_ecommerce/view/productdetails/widget/custom_place_holder.dart';
import 'package:task_6_ecommerce/view/productdetails/widget/custom_product_images.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_circle_icon_appbar.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_circle_icon_without_dot.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.put(ProductDetailsController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<ProductDetailsController>(
        builder: (controller1) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCircleWithOutDot(
                    assetName: controller1.isAddedToFavorite
                        ? AppImageAsset.favoriteFillIcon
                        : AppImageAsset.favoriteIcon,
                    radius: 26,
                    onTap: () {
                      controller1.isAddedToFavorite
                          ? controller1.removeFromFavorite(
                              controller1.productModel.id.toString())
                          : controller1.addToFavorite(
                              controller1.productModel.id.toString());
                    },
                    backgroundColor: AppColors.greyColor4,
                    color: controller1.isAddedToFavorite
                        ? AppColors.redColor3
                        : AppColors.blackTextAndIconsColor
                    // radius: 26,
                    ),
                controller1.isAddedToCart
                    ? const CustomPlaceHolder(text: 'This Item in your cart')
                    : CustomButtonCart(
                        text: 'Add to Cart',
                        assetName: AppImageAsset.cartIcon,
                        onPressed: () {
                          controller.addToCart();
                        })
              ],
            ),
          );
        },
      ),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: CustomCircleIconAppBar(
            assetName: AppImageAsset.backIcon,
            onTap: () {
              controller.goToBack();
            },
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: CustomCircleIconAppBar(
              assetName: AppImageAsset.cartIcon,
              isNew: true,
              onTap: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'programmer T-shirt',
                style: Styles.style26,
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                controller.productModel.subCategory!.category!.name!,
                style: Styles.style16.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.greyColor3),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$${controller.productModel.price.toString()}",
                    style: Styles.style24,
                  ),
                  Image.asset(
                    AppImageAsset.product,
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
              Image.asset(AppImageAsset.photoEffect),
              SizedBox(
                height: 37.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) {
                        return Row(
                          children: [
                            const CustomProductImages(),
                            SizedBox(
                              width: 14.w,
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              ReadMoreText(
                'Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there ...... Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there ...... Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there ...... Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there ...... Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there ...... Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there ...... ',
                trimCollapsedText: "Read More",
                trimExpandedText: "Read Less",
                trimLines: 4,
                trimMode: TrimMode.Line,
                style: Styles.style11,
                colorClickableText: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
