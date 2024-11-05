import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_6_ecommerce/core/constant/app_image_asset.dart';
import 'package:task_6_ecommerce/view/cart/widget/custom_add_and_remove_item_cart.dart';
import 'package:task_6_ecommerce/view/cart/widget/custom_cart_item.dart';
import 'package:task_6_ecommerce/view/cart/widget/custom_delete_item_button_cart.dart';

class CustomSkeletonizerCartLoading extends StatelessWidget {
  const CustomSkeletonizerCartLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        closeOnScroll: true,
        endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const BehindMotion(),
            children: [
              CustomDeleteItemButtonCart(
                onTap: () {},
              )
            ]),
        startActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const BehindMotion(),
            children: [
              CustomAddAndRemoveItemCart(
                itemCount: '1',
                onTapAddButton: () {},
                onTapDecreaseButton: () {},
              )
            ]),
        child: const CustomCartItems(
          productImage: AppImageAsset.product,
          productName: 'Programmer T-shirt',
          productPrice: '100',
        ));
  }
}
