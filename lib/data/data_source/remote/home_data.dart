import 'package:task_6_ecommerce/core/class/crud.dart';
import 'package:task_6_ecommerce/core/sevices/api_links.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getCategoriesData() async {
    var response = await crud.getData(ApiLinks.categories);
    return response.fold((l) => l, (r) => r);
  }

  getProductsData() async {
    var response = await crud.getData(ApiLinks.products);
    return response.fold((l) => l, (r) => r);
  }
}
