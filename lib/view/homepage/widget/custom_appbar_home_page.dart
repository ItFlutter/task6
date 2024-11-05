import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/view/homepage/controller/home_page_controller.dart';
import 'package:task_6_ecommerce/view/widget/shared/custom_circle_icon_appbar.dart';
import 'package:task_6_ecommerce/view/homepage/widget/custom_logo_appbar.dart';

class CustomAppBarHomePage extends GetView<HomePageController> {
  const CustomAppBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            AppImageAsset.drawerIcon,
            fit: BoxFit.scaleDown,
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: CustomCircleIconAppBar(
                assetName: AppImageAsset.cartIcon,
                isNew: true,
                onTap: () {
                  controller.goToCartPage();
                },
              ))
        ],
        title: const CustomLogoAppBar(text: "Explore"));
  }
}
