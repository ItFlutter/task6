import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/class/sql_db.dart';
import 'package:task_6_ecommerce/core/class/status_request.dart';
import 'package:task_6_ecommerce/core/constant/app_routes.dart';
import 'package:task_6_ecommerce/core/functions/handling_data_controller.dart';
import 'package:task_6_ecommerce/data/data_source/remote/cart_data.dart';
import 'package:task_6_ecommerce/data/data_source/remote/home_data.dart';
import 'package:task_6_ecommerce/data/model/cart_model/cart_model.dart';
import 'package:task_6_ecommerce/data/model/category_model.dart';
import 'package:task_6_ecommerce/data/model/product_model/product_model.dart';
import 'package:task_6_ecommerce/data/model/product_model/product_model.dart';

class HomePageController extends GetxController {
  List favorite = [];
  SqlDb sqlDb = Get.find();
  List<CategoryModel> categoriesModel = [];
  List<ProductModel> productsModel = [];
  List<CartModel> cartModel = [];
  HomeData homeData = HomeData(Get.find());
  CartData cartData = CartData(Get.find());
  late final TextEditingController search;
  StatusRequest statusRequest = StatusRequest.none;
  getCategoriesData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getCategoriesData();
    print("==================== CategoriesData $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['data'].isEmpty) {
        statusRequest = StatusRequest.failure;
      } else {
        List listData = response['data'];
        categoriesModel.addAll(listData.map((e) => CategoryModel.fromJson(e)));
      }
    }
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
      await getFavoriteData();
    } else {
      Get.defaultDialog(
          title: "Warning", content: const Text("Something Went Wrong"));
    }
    statusRequest = StatusRequest.none;
    update();
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
      await getFavoriteData();
    } else {
      Get.defaultDialog(
          title: "Warning", content: const Text("Something Went Wrong"));
    }
    statusRequest = StatusRequest.none;
    update();
  }

  addToCart(int productId, [String? quantity]) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addData({
      'quantity': '1',
      'product_id': productId.toString(),
    });
    print("==================== addToCart $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['data'].isEmpty) {
        statusRequest = StatusRequest.failure;
      } else {
        Get.rawSnackbar(title: "Success", message: "Added To Cart");
        await getCartData();
      }
    }
    update();
  }

  getFavoriteData() async {
    favorite = [];
    statusRequest = StatusRequest.loading;
    update();
    favorite = await sqlDb.readData('select * from ecommerce');
    statusRequest = StatusRequest.none;
    print("========== favorite ==========$favorite");
    update();
  }

  getCartData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getData();
    print("==================== getCartData $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['data'].isEmpty) {
        statusRequest = StatusRequest.failure;
      } else {
        List listData = response['data'];
        cartModel.addAll(listData.map((e) => CartModel.fromJson(e)));
      }
    }
    update();
  }

  goToProductDetailsPage(
      ProductModel productModel, bool isAddedToCart, bool isAddedToFavorite) {
    Get.toNamed(AppRoutes.productdetails, arguments: {
      'productmodel': productModel,
      'isaddedtocart': isAddedToCart,
      'isaddedtofavorite': isAddedToFavorite
    });
  }

  goToCartPage() {
    Get.toNamed(AppRoutes.cart);
  }

  getProductsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getProductsData();
    print("==================== ProductsData $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['data'].isEmpty) {
        statusRequest = StatusRequest.failure;
      } else {
        List listData = response['data'];
        productsModel.addAll(listData.map((e) => ProductModel.fromJson(e)));
        print("==================== ProductsModel $productsModel");
      }
    }
    update();
  }

  bool isAddedToCart(int productId) {
    for (int i = 0; i < cartModel.length; i++) {
      if (cartModel[i].peoduct!.id == productId) {
        return true;
      }
    }
    return false;
  }

  bool isAddedToFavorite(int productId) {
    for (int i = 0; i < favorite.length; i++) {
      if (int.parse(favorite[i]['productid']) == productId) {
        return true;
      }
    }
    return false;
  }

  getHomeData() async {
    await getCategoriesData();
    await getProductsData();
    await getCartData();
    await getFavoriteData();
  }

  @override
  void onInit() {
    getHomeData();
    search = TextEditingController();
    super.onInit();
  }
}
