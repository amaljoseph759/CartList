import 'package:cartlist/const.dart';
import 'package:cartlist/productItem/ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/cartPage.dart';
import '../cart/cartcontroller.dart';

class SingleItem extends StatelessWidget {
  SingleItem({super.key});
  SingleItemController singleItemController = Get.put(SingleItemController());
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          singleItemController.singleitemList[0].title.toString(),
          overflow: TextOverflow.ellipsis,
        ),
        actions: const [CartIcon()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                    singleItemController.singleitemList[0].image.toString()),
              ),
              kSizedBox15,
              Text(singleItemController.singleitemList[0].title.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              kSizedBox10,
              Text(
                  "₹ ${singleItemController.singleitemList[0].price.toString()}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              kSizedBox10,
              const Text("Description",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const Divider(),
              Text(
                  singleItemController.singleitemList[0].description.toString(),
                  style: const TextStyle(
                    fontSize: 13,
                  )),
              kSizedBox10,
              Divider(),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      !cartController.isExist(
                              id: singleItemController.singleitemList[0].id)
                          ? MaterialButton(
                              onPressed: () async {
                                await cartController.addtoCart(singleitem(
                                    id: singleItemController
                                        .singleitemList[0].id,
                                    image: singleItemController
                                        .singleitemList[0].image,
                                    title: singleItemController
                                        .singleitemList[0].title,
                                    price: singleItemController
                                        .singleitemList[0].price,
                                    quntity: 1));
                                Get.snackbar("Message", "Item added to cart",
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    duration: Duration(seconds: 1));
                              },
                              child: Text("Add to Cart"),
                              color: Colors.greenAccent,
                            )
                          : MaterialButton(
                              onPressed: () {
                                Get.to(CartPage());
                              },
                              child: Text("Go to Cart"),
                              color: Colors.greenAccent,
                            )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
