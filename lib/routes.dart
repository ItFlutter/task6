import 'package:get/get.dart';

import 'package:task_6_ecommerce/core/constant/app_routes.dart';
import 'package:task_6_ecommerce/core/middleware/my_middleware.dart';
import 'package:task_6_ecommerce/view/auth/login/screen/login.dart';

List<GetPage<dynamic>>? routes = [
  //================================ Auth ===========================================
  GetPage(
      name: AppRoutes.login,
      page: () => const Login(),
      middlewares: [MyMiddleWare()]),
];
