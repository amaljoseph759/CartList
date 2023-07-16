import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart/cartPage.dart';

const Widget kSizedBox5 = SizedBox(height: 5);
const Widget kSizedBox10 = SizedBox(height: 10);
const Widget kSizedBox15 = SizedBox(height: 15);
const Widget kSizedBox20 = SizedBox(height: 20);
const Widget kSizedBox25 = SizedBox(height: 25);
const Widget kSizedBox30 = SizedBox(height: 30);
const Widget kSizedBox35 = SizedBox(height: 35);
const Widget kSizedBox40 = SizedBox(height: 40);
const Widget kSizedBox45 = SizedBox(height: 45);
const Widget kSizedBox50 = SizedBox(height: 50);

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Get.to(CartPage()),
        icon: const Icon(Icons.shopping_bag_outlined));
  }
}
