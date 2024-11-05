import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/view/home/controller/home_controller.dart';
import 'package:task_6_ecommerce/view/home/widget/custom_bottom_navigation_bar.dart';
import 'package:task_6_ecommerce/view/home/widget/custom_floating_action_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomFloatingActionButton(
            onPressed: () {
              controller.goToCartPage();
            },
          ),
          bottomNavigationBar: const CustomBottomNavigationBar(),
          body: controller.pages[controller.currentPage],
        );
      },
    );
  }
}
