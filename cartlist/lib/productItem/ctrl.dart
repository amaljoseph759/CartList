import 'package:flutter/material.dart';
import 'package:get/get.dart';

class singleitem {
  int? id;
  String? image;
  String? title;
  double? price;
  String? description;
  int? quntity;
  singleitem(
      {this.id,
      this.image,
      this.price,
      this.title,
      this.description,
      this.quntity});
}

class SingleItemController extends GetxController {
  var singleitemList = <singleitem>[].obs;
  addtosingleitem(item) {
    singleitemList.clear();

    singleitemList.add(item);
    print(item);
  }
}
