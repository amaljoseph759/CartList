import 'package:cartlist/productList/productsModel.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductListsController extends GetxController {
  var productsList = <ProductLists>[].obs;
  RxBool isLoading = false.obs;

  void productListsApi() async {
    isLoading.value = true;
    final url = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    try {
      print(">>>>>>>>>>>>>>>");
      if (response.statusCode == 200) {
        print("200");
        productsList.value =
            List<ProductLists>.from(data.map((x) => ProductLists.fromJson(x)))
                .toList();
        print(productsList);
        isLoading.value = false;
      } else {
        productsList.value = [];
      }
    } catch (e) {
      print(e.toString());
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    productListsApi();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    productListsApi();
    // TODO: implement dispose
    super.dispose();
  }
}
