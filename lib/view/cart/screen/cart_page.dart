import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_6_ecommerce/core/constant/app_colors.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/view/cart/controller/cart_controller.dart';
import 'package:task_6_ecommerce/view/cart/widget/custom_add_and_remove_item_cart.dart';
import 'package:task_6_ecommerce/view/cart/widget/custom_bottom_navigation_bar.dart';
import 'package:task_6_ecommerce/view/cart/widget/custom_cart_item.dart';
import 'package:task_6_ecommerce/view/cart/widget/custom_delete_item_button_cart.dart';
import 'package:task_6_ecommerce/view/cart/widget/custom_skeletonizer_cart_loading.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_circle_icon_appbar.dart';
import '../../../core/constant/styles.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
        return const CustomBottomNavigationBarCart();
      }),
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: Styles.style16,
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: CustomCircleIconAppBar(
            assetName: AppImageAsset.backIcon,
            onTap: () {
              Get.back();
            },
          ),
        ),
      ),
      body: GetBuilder<CartController>(
        // init: CartController(),
        builder: (controller) {
          print(controller.noData);

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${controller.cartModel.length} item',
                  style: Styles.style16.copyWith(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkBlueColor),
                ),
                Expanded(
                    child: controller.noData
                        ? const Center(
                            child: Text("No item in your cart"),
                          )
                        : ListView.builder(
                            itemCount: controller.cartModel.isEmpty
                                ? 2
                                : controller.cartModel.length,
                            itemBuilder: (context, index) {
                              return Skeletonizer(
                                enabled:
                                    controller.cartModel.isEmpty ? true : false,
                                child: controller.cartModel.isEmpty
                                    ? const CustomSkeletonizerCartLoading()
                                    : Slidable(
                                        closeOnScroll: true,
                                        endActionPane: ActionPane(
                                            extentRatio: 0.2,
                                            motion: const BehindMotion(),
                                            children: [
                                              CustomDeleteItemButtonCart(
                                                onTap: () {
                                                  controller.deleteItemCart(
                                                      controller
                                                          .cartModel[index],
                                                      index);
                                                },
                                              )
                                            ]),
                                        startActionPane: ActionPane(
                                            extentRatio: 0.2,
                                            motion: const BehindMotion(),
                                            children: [
                                              CustomAddAndRemoveItemCart(
                                                itemCount: controller
                                                    .cartModel[index].quantity
                                                    .toString(),
                                                onTapAddButton: () {
                                                  controller
                                                      .incressQuantityItem(
                                                          controller
                                                              .cartModel[index],
                                                          index);
                                                },
                                                onTapDecreaseButton: () {
                                                  controller
                                                      .onTapDecreaseButton(
                                                          controller
                                                              .cartModel[index],
                                                          index);
                                                },
                                              )
                                            ]),
                                        child: CustomCartItems(
                                          productImage: AppImageAsset.product,
                                          productName: 'Programmer T-shirt',
                                          productPrice: controller
                                              .cartModel[index].peoduct!.price
                                              .toString(),
                                        )),
                              );
                            },
                          ))
              ],
            ),
          );
        },
      ),
    );
  }
}
// SlidableAction(
                  //     borderRadius: BorderRadius.circular(8),
                  //     flex: 2,
                  //     backgroundColor: Colors.red,
                  //     icon: Icons.delete_outline_outlined,
                  //     onPressed: (context) {
                  //       Get.defaultDialog(
                  //           title: "warning",
                  //           middleText: "Are You Sure To Delete?",
                  //           titleStyle: const TextStyle(
                  //               color: AppColors.blackTextAndIconsColor),
                  //           confirmTextColor: AppColors.whiteColor,
                  //           cancelTextColor: AppColors.blackTextAndIconsColor,
                  //           buttonColor: AppColors.redColor,
                  //           onCancel: () {},
                  //           onConfirm: () {
                  //             Get.back();
                  //           });
                  //     })