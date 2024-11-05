import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/class/sql_db.dart';
import 'package:task_6_ecommerce/core/class/status_request.dart';
import 'package:task_6_ecommerce/core/functions/handling_data_controller.dart';
import 'package:task_6_ecommerce/data/data_source/remote/product_data.dart';
import 'package:task_6_ecommerce/data/model/product_model/product_model.dart';

class FavoriteController extends GetxController {
  bool noData = false;
  ProductData productData = ProductData(Get.find());
  List favorite = [];
  SqlDb sqlDb = Get.find();
  List<ProductModel> productsModel = [];
  StatusRequest statusRequest = StatusRequest.none;
  getFavoriteData() async {
    favorite = [];
    statusRequest = StatusRequest.loading;
    update();
    favorite = await sqlDb.readData('select * from ecommerce');
    statusRequest = StatusRequest.none;
    print("========== favorite ==========$favorite");
    if (favorite.isEmpty) {
      noData = true;
    }
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
      productsModel.removeWhere(
        (element) {
          return element.id == int.parse(productId);
        },
      );
      if (productsModel.isEmpty) {
        noData = true;
      }
    } else {
      Get.defaultDialog(
          title: "Warning", content: const Text("Something Went Wrong"));
    }
    statusRequest = StatusRequest.none;
    update();
  }

  getProductsData(String productId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await productData.getProductData(productId);
    print("==================== ProductsData $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['data'].isEmpty) {
        statusRequest = StatusRequest.failure;
      } else {
        Map<String, dynamic> listData = response['data'];
        productsModel.add(ProductModel.fromJson(listData));
        print("==================== ProductsModel $productsModel");
      }
    }
    update();
  }

  getData() async {
    await getFavoriteData();
    favorite.forEach(
      (element) {
        getProductsData(element['productid']);
      },
    );
    update();
  }

  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }
}
