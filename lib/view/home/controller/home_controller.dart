import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/core/constant/app_routes.dart';
import 'package:task_6_ecommerce/view/favorite/screen/favorite_page.dart';
import 'package:task_6_ecommerce/view/homepage/screen/home_page.dart';
import 'package:task_6_ecommerce/view/notification/screen/notification_page.dart';
import 'package:task_6_ecommerce/view/profile/screen/profile_page.dart';

class HomeController extends GetxController {
  int currentPage = 0;
  List<String> iconsAssets = [
    AppImageAsset.homeIcons,
    AppImageAsset.favoriteIcon,
    AppImageAsset.notificationIcon,
    AppImageAsset.personIcon,
  ];
  List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    NotificationPage(),
    ProfilePage()
  ];
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  goToCartPage() {
    Get.toNamed(AppRoutes.cart);
  }
}
