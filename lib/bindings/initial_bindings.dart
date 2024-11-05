import 'package:get/get.dart';
import 'package:task_6_ecommerce/core/class/sql_db.dart';
import '../core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(SqlDb());
  }
}
