import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../productItem/ctrl.dart';

class CartController extends GetxController {
  var cartitems = <singleitem>[].obs;
  var total = 0.0.obs;

  addtoCart(item) {
    cartitems.add(item);
    print(item);
    calculatedPrice();
  }

  removeFromCart(id) {
    for (int i = 0; i < cartitems.length; i++) {
      if (cartitems[i].id == id) {
        print("ifffffff");

        cartitems.removeAt(i);
        print(cartitems);
      }
    }
    calculatedPrice();
  }

  updateCart({required id, required bool isincrement}) {
    for (int i = 0; i < cartitems.length; i++) {
      if (cartitems[i].id == id) {
        isincrement
            ? cartitems[i].quntity = cartitems[i].quntity! + 1
            : {
                if ((cartitems[i].quntity! - 1) > 0)
                  {cartitems[i].quntity = cartitems[i].quntity! - 1}
                else
                  {removeFromCart(id)}
              };

        print(cartitems[i].quntity);
      }
    }
    calculatedPrice();
    print(cartitems[0].quntity);
  }

  bool isExist({required id}) {
    for (int i = 0; i < cartitems.length; i++) {
      if (cartitems[i].id == id) {
        return true;
      }
    }
    return false;
  }

  calculatedPrice() {
    for (int i = 0; i < cartitems.length; i++) {
      total.value = cartitems[i].quntity! * cartitems[i].price!;
    }
  }
}
