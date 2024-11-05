import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/class/status_request.dart';
import 'package:task_6_ecommerce/core/functions/handling_data_controller.dart';
import 'package:task_6_ecommerce/data/data_source/remote/cart_data.dart';
import 'package:task_6_ecommerce/data/model/cart_model/cart_model.dart';

class CartController extends GetxController {
  bool noData = false;
  double totalPrice = 0;
  List<CartModel> cartModel = [];
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  getCartData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getData();
    print("==================== getCartData $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['data'].isEmpty) {
        noData = true;
        statusRequest = StatusRequest.failure;
      } else {
        List listData = response['data'];
        cartModel.addAll(listData.map((e) => CartModel.fromJson(e)));
      }
    }
    update();
  }

  incressQuantityItem(CartModel cartItemModel, int index) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.updateData(cartItemModel.id.toString(), {
      'product_id': cartItemModel.peoduct!.id.toString(),
      'quantity': (cartItemModel.quantity! + 1).toString(),
      '_method': 'PUT'
    });
    print("==================== incressQuantityItem $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['data'].isEmpty) {
        statusRequest = StatusRequest.failure;
      } else {
        cartModel[index].quantity = cartModel[index].quantity! + 1;
        totalPrice += cartModel[index].peoduct!.price!;
        // cartItemModel.quantity! + 1;
        Get.rawSnackbar(
            title: 'Success',
            message: 'The quantity of the selected item has been increased');
      }
    }
    update();
  }

  onTapDecreaseButton(CartModel cartItemModel, int index) {
    if (cartItemModel.quantity == 1) {
      deleteItemCart(cartItemModel, index);
    } else {
      decreaseQuantityItem(cartItemModel, index);
    }
  }

  deleteItemCart(CartModel cartItemModel, int index) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .deleteData(cartItemModel.id.toString(), {'_method': 'delete'});
    print("==================== deleteItemCart $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['data'].isEmpty) {
        // statusRequest = StatusRequest.failure;
        // cartModel[index].quantity = cartModel[index].quantity! - 1;
        totalPrice -= cartModel[index].peoduct!.price!;
        cartModel.removeWhere(
          (element) {
            return element.id == cartModel[index].id;
          },
        );
        Get.rawSnackbar(
            title: 'Success',
            message: 'The selected item has been deleted from the cart');
        if (cartModel.isEmpty) {
          noData = true;
        }

        // cartItemModel.quantity! + 1;
      }
    }
    update();
  }

  decreaseQuantityItem(CartModel cartItemModel, int index) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.updateData(cartItemModel.id.toString(), {
      'product_id': cartItemModel.peoduct!.id.toString(),
      'quantity': (cartItemModel.quantity! + -1).toString(),
      '_method': 'PUT'
    });
    print("==================== decreaseQuantityItem $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['data'].isEmpty) {
        statusRequest = StatusRequest.failure;
      } else {
        cartModel[index].quantity = cartModel[index].quantity! - 1;
        totalPrice -= cartModel[index].peoduct!.price!;
        Get.rawSnackbar(
            title: 'Success',
            message: 'The quantity of the selected item has been decreased');
        // cartItemModel.quantity! + 1;
      }
    }
    update();
  }

  getTotalPrice() {
    cartModel.forEach(
      (e) {
        totalPrice += (e.peoduct!.price)! * (e.quantity!);
      },
    );
    update();
  }

  getData() async {
    await getCartData();
    getTotalPrice();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
