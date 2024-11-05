import 'package:task_6_ecommerce/core/class/crud.dart';
import 'package:task_6_ecommerce/core/sevices/api_links.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addData(Map data) async {
    var response = await crud.postData(ApiLinks.cart, data);
    return response.fold((l) => l, (r) => r);
  }

  getData() async {
    var response = await crud.getData(ApiLinks.cart);
    return response.fold((l) => l, (r) => r);
  }

//'_method': 'PUT'
  updateData(String cartItemId, Map data) async {
    var response = await crud.postData('${ApiLinks.cart}/$cartItemId', data);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String cartItemId, Map data) async {
    var response = await crud.postData('${ApiLinks.cart}/$cartItemId', data);
    return response.fold((l) => l, (r) => r);
  }
}
