import 'package:task_6_ecommerce/core/class/crud.dart';
import 'package:task_6_ecommerce/core/sevices/api_links.dart';

class ProductData {
  Crud crud;
  ProductData(this.crud);

  getProductData(String productId) async {
    var response = await crud.getData('${ApiLinks.products}/$productId');
    return response.fold((l) => l, (r) => r);
  }
}
