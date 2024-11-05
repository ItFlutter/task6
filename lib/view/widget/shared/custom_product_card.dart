import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';
import 'package:task_6_ecommerce/view/homepage/controller/home_page_controller.dart';
import 'package:task_6_ecommerce/view/homepage/widget/custom_button_add_to_cart.dart';
import '../../../core/constant/app_colors.dart';

class CustomProductCard extends GetView<HomePageController> {
  final String productName;
  final bool isAddedToCart;
  final bool isAddedToFavorite;
  final String subCategoryName;
  final String productImagePath;
  final double productPrice;
  final void Function() onTapAddToCart;
  final void Function() onTapFavoriteButton;

  const CustomProductCard(
      {super.key,
      required this.productName,
      required this.onTapAddToCart,
      required this.onTapFavoriteButton,
      required this.subCategoryName,
      required this.productImagePath,
      required this.productPrice,
      required this.isAddedToCart,
      required this.isAddedToFavorite});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.0.w, right: 12.w, top: 12.h),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  InkWell(
                    onTap: onTapFavoriteButton,
                    child: isAddedToFavorite
                        ? SvgPicture.asset(
                            AppImageAsset.favoriteFillIcon,
                            height: 13.h,
                            color: AppColors.redColor3,
                          )
                        : SvgPicture.asset(
                            AppImageAsset.favoriteIcon,
                            height: 16.h,
                            color: AppColors.greyColor2,
                          ),
                  ),
                  Center(
                    child: Image.asset(
                      productImagePath,
                      fit: BoxFit.scaleDown,
                      height: 85.h,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Text(
                subCategoryName,
                style: Styles.style12.copyWith(color: AppColors.primaryColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Text(
                productName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.style14,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0.w),
              child: Row(
                children: [
                  Text(
                    "\$$productPrice",
                    style: Styles.styleBlack14,
                  ),
                  const Spacer(),
                  isAddedToCart
                      ? const SizedBox()
                      : CustomButtonAddToCart(
                          color: AppColors.primaryColor,
                          icon: Icons.add,
                          size: 20,
                          onTap: onTapAddToCart,
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
