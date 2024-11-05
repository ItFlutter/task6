import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_6_ecommerce/view/home/controller/home_controller.dart';
import 'package:task_6_ecommerce/view/home/widget/custom_item_bottom_navigation_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              children: [
                ...List.generate(controller.pages.length + 1, (index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CustomItemBottomNavigationBar(
                          index: i,
                          onPressed: () {
                            controller.onPageChanged(i);
                          });
                }),
              ],
            ));
      },
    );
  }
}
