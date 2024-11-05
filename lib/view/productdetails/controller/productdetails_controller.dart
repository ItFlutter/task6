import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/class/sql_db.dart';
import 'package:task_6_ecommerce/core/class/status_request.dart';
import 'package:task_6_ecommerce/data/model/product_model/product_model.dart';
import 'package:task_6_ecommerce/view/homepage/controller/home_page_controller.dart';

class ProductDetailsController extends GetxController {
  SqlDb sqlDb = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  HomePageController controller = Get.find();
  late ProductModel productModel;
  late bool isAddedToCart;
  late bool isAddedToFavorite;
  goToBack() {
    Get.back();
  }

  removeFromFavorite(String productId) async {
    statusRequest = StatusRequest.loading;
    update();
    int response = await sqlDb
        .insertData("delete from ecommerce where productid=$productId");
    print("========== Response ========== $response");

    if (response > 0) {
      Get.rawSnackbar(
          title: 'Success',
          message: 'The selected item has been deleted from favorite');

      isAddedToFavorite = false;
      HomePageController controller = Get.find();
      controller.getFavoriteData();
    } else {
      Get.defaultDialog(
          title: "Warning", content: const Text("Something Went Wrong"));
    }
    statusRequest = StatusRequest.none;
    update();
  }

  addToFavorite(String productId) async {
    statusRequest = StatusRequest.loading;
    update();
    int response = await sqlDb
        .insertData('insert into ecommerce(productid) values ("$productId")');
    print("========== Response ========== $response");

    if (response > 0) {
      Get.rawSnackbar(
          title: 'Success',
          message: 'The selected item has been added to favorite');
      isAddedToFavorite = true;
      HomePageController controller = Get.find();
      controller.getFavoriteData();
    } else {
      Get.defaultDialog(
          title: "Warning", content: const Text("Something Went Wrong"));
    }
    statusRequest = StatusRequest.none;
    update();
  }

  addToCart() {
    controller.addToCart(productModel.id!);
    isAddedToCart = true;
    update();
  }

  @override
  void onInit() {
    productModel = Get.arguments['productmodel'];
    isAddedToCart = Get.arguments['isaddedtocart'];
    isAddedToFavorite = Get.arguments['isaddedtofavorite'];
    // TODO: implement onInit
    super.onInit();
  }
}
