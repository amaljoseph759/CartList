import 'package:cartlist/cart/orderplaced.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cartcontroller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: cartController.cartitems.length > 0
              ? Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  color: Colors.greenAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total amount : ₹ ${cartController.total.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(OrderPlaced());
                            cartController.cartitems.clear();
                          },
                          icon: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.amber[400], // Background color
                                borderRadius: BorderRadius.circular(
                                    20), // Rounded corners
                                border: Border.all(
                                    color: Colors.black, width: 1), // Border
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 2),
                                    blurRadius: 14,
                                  ),
                                ], // Shadow
                              ),
                              child: const Text(
                                "place the order",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )))
                    ],
                  ),
                )
              : Divider(),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.greenAccent,
            title: const Text("My Cart"),
          ),
          body: cartController.cartitems.length > 0
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cartController.cartitems.length,
                          itemBuilder: (BuildContext context, index) {
                            return ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartController.cartitems[index].title
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("₹" +
                                          cartController.cartitems[index].price
                                              .toString()),
                                      Container(
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  cartController.updateCart(
                                                      id: cartController
                                                          .cartitems[index].id,
                                                      isincrement: false);
                                                },
                                                icon: const Icon(Icons
                                                    .remove_circle_outline)),
                                            Text(cartController
                                                .cartitems[index].quntity
                                                .toString()),
                                            IconButton(
                                                onPressed: () {
                                                  cartController.updateCart(
                                                      id: cartController
                                                          .cartitems[index].id,
                                                      isincrement: true);
                                                },
                                                icon: const Icon(Icons
                                                    .add_circle_outline_rounded)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              leading: Image.network(
                                cartController.cartitems[index].image
                                    .toString(),
                                fit: BoxFit.fill,
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  cartController.removeFromCart(
                                    cartController.cartitems[index].id,
                                  );
                                },
                              ),
                            );
                          }),
                    ],
                  ),
                )
              : const Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 100,
                    ),
                    Text(
                      "Cart is Empty",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
        ));
  }
}
