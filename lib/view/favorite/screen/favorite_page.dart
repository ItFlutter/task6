import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/core/constant/styles.dart';
import 'package:task_6_ecommerce/view/favorite/controller/favorite_controller.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_circle_icon_appbar.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_product_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
        init: FavoriteController(),
        builder: (controller) {
          return SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Favourite",
                  style: Styles.style16,
                ),
                SizedBox(
                  height: 28.h,
                ),
                Expanded(
                    child: controller.noData
                        ? const Center(
                            child: Text("No items in your favorite ..."),
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: controller.productsModel.isEmpty
                                ? 2
                                : controller.productsModel.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, right: 10.w),
                                    child: Skeletonizer(
                                      enabled: controller.productsModel.isEmpty
                                          ? true
                                          : false,
                                      child: InkWell(
                                        onTap: () {
                                          // controller.goToProductDetailsPage(
                                          //     controller.productsModel[index],
                                          //     controller.isAddedToCart(controller
                                          //         .productsModel[index].id!));
                                        },
                                        child: controller.productsModel.isEmpty
                                            ? CustomProductCard(
                                                onTapFavoriteButton: () {},
                                                onTapAddToCart: () {},
                                                isAddedToCart: true,
                                                isAddedToFavorite: true,
                                                productName:
                                                    'programmer T-shirt',
                                                subCategoryName: 'BEST SELLER',
                                                productImagePath:
                                                    AppImageAsset.product,
                                                productPrice: 150.00)
                                            : CustomProductCard(
                                                isAddedToFavorite: true,
                                                onTapFavoriteButton: () {
                                                  controller.removeFromFavorite(
                                                      controller
                                                          .productsModel[index]
                                                          .id!
                                                          .toString());
                                                },
                                                onTapAddToCart: () {},
                                                isAddedToCart: true,
                                                productName:
                                                    'programmer T-shirt',
                                                subCategoryName: 'BEST SELLER',
                                                productImagePath:
                                                    AppImageAsset.product,
                                                productPrice: controller
                                                    .productsModel[index].price!
                                                    .toDouble()),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }))
              ],
            ),
          );
        });
  }
}
