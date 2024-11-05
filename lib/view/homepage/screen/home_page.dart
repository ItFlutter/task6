import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';
import 'package:task_6_ecommerce/view/homepage/controller/home_page_controller.dart';
import 'package:task_6_ecommerce/view/homepage/widget/custom_appbar_home_page.dart';
import 'package:task_6_ecommerce/view/homepage/widget/custom_banner_home_page.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_product_card.dart';
import 'package:task_6_ecommerce/view/homepage/widget/custom_row_see_all.dart';
import 'package:task_6_ecommerce/view/homepage/widget/custom_search_text_form_field.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_button.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_circle_icon_without_dot.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return ListView(
            children: [
              const CustomAppBarHomePage(),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSearchTextFormField(
                        controller: controller.search,
                        hintText: 'Looking for ......',
                        onPressedIconButton: () {},
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    const CustomCircleWithOutDot(
                        assetName: AppImageAsset.settingIcon,
                        radius: 26,
                        backgroundColor: AppColors.primaryColor,
                        color: AppColors.whiteColor)
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Text(
                  'Select Category',
                  style: Styles.style16,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                    controller.categoriesModel.isEmpty
                        ? 5
                        : controller.categoriesModel.length,
                    (index) => Row(
                      children: [
                        Skeletonizer(
                          enabled:
                              controller.categoriesModel.isEmpty ? true : false,
                          child: CustomButton(
                            text: controller.categoriesModel.isEmpty
                                ? ''
                                : controller.categoriesModel[index].name!,
                            isActive: false,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        )
                      ],
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const CustomRowSeeAll(text: 'Popular T-shirt')),
              SizedBox(
                height: 16.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        controller.productsModel.isEmpty
                            ? 5
                            : controller.productsModel.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Skeletonizer(
                                enabled: controller.productsModel.isEmpty
                                    ? true
                                    : false,
                                child: InkWell(
                                  onTap: () {
                                    controller.goToProductDetailsPage(
                                        controller.productsModel[index],
                                        controller.isAddedToCart(controller
                                            .productsModel[index].id!),
                                        controller.isAddedToFavorite(controller
                                            .productsModel[index].id!));
                                  },
                                  child: controller.productsModel.isEmpty
                                      ? CustomProductCard(
                                          onTapFavoriteButton: () {},
                                          onTapAddToCart: () {},
                                          isAddedToCart: true,
                                          isAddedToFavorite: false,
                                          productName: 'programmer T-shirt',
                                          subCategoryName: 'BEST SELLER',
                                          productImagePath:
                                              AppImageAsset.product,
                                          productPrice: 150.00)
                                      : CustomProductCard(
                                          onTapFavoriteButton: () {
                                            controller.isAddedToFavorite(
                                                    controller
                                                        .productsModel[index]
                                                        .id!)
                                                ? controller.removeFromFavorite(
                                                    controller
                                                        .productsModel[index]
                                                        .id!
                                                        .toString())
                                                : controller.addToFavorite(
                                                    controller
                                                        .productsModel[index]
                                                        .id!
                                                        .toString());
                                          },
                                          onTapAddToCart: () {
                                            controller.addToCart(controller
                                                .productsModel[index].id!);
                                          },
                                          isAddedToCart: controller
                                              .isAddedToCart(controller
                                                  .productsModel[index].id!),
                                          isAddedToFavorite:
                                              controller.isAddedToFavorite(
                                            controller.productsModel[index].id!,
                                          ),
                                          productName: 'programmer T-shirt',
                                          subCategoryName: 'BEST SELLER',
                                          productImagePath:
                                              AppImageAsset.product,
                                          productPrice: controller
                                              .productsModel[index].price!
                                              .toDouble()),
                                ),
                              ),
                            ))),
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const CustomRowSeeAll(text: 'New Arrivals')),
              SizedBox(
                height: 21.h,
              ),
              Padding(
                  padding:
                      EdgeInsets.only(bottom: 20.0.h, right: 20.w, left: 20.w),
                  child: const CustomBannerHomePage(
                      title: "Summer Sale", subTitle: "15% OFF")),
            ],
          );
        });
  }
}
