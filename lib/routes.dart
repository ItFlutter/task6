import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/constant/app_routes.dart';
import 'package:task_6_ecommerce/view/cart/screen/cart_page.dart';
import 'package:task_6_ecommerce/view/home/screen/home.dart';
import 'package:task_6_ecommerce/view/productdetails/screen/productdetails_page.dart';

List<GetPage<dynamic>>? routes = [
  //==================== Home ====================
  GetPage(
    name: AppRoutes.home,
    page: () => const Home(),
  ),
  //==================== Cart ====================
  GetPage(
    name: AppRoutes.cart,
    page: () => const CartPage(),
  ),
  //==================== ProductDetails ====================
  GetPage(
    name: AppRoutes.productdetails,
    page: () => const ProductDetailsPage(),
  ),
];
