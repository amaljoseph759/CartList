import 'package:cartlist/productList/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const.dart';
import '../productItem/ctrl.dart';
import '../productItem/productpage.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});
  ProductListsController productListsController =
      Get.put(ProductListsController());
  SingleItemController singleitemcontroller = Get.put(SingleItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          actions: const [CartIcon()],
          centerTitle: true,
          title: const Text("products"),
        ),
        body: Obx(
          () => productListsController.isLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  children: List.generate(
                      productListsController.productsList.length, (index) {
                    return GestureDetector(
                      onTap: () async {
                        await singleitemcontroller.addtosingleitem(singleitem(
                            id: productListsController.productsList[index].id,
                            image: productListsController
                                .productsList[index].image,
                            price: productListsController
                                .productsList[index].price,
                            title: productListsController
                                .productsList[index].title,
                            description: productListsController
                                .productsList[index].description,
                            quntity: 0));
                        print(productListsController.productsList[index].id);
                        Get.to(SingleItem());
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  // MediaQuery.of(context).size.height / 4,

                                  child: Image.network(
                                      productListsController
                                          .productsList[index].image,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  productListsController
                                      .productsList[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "₹ ${productListsController.productsList[index].price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
        ));
  }
}
