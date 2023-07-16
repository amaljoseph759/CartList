import 'package:cartlist/productList/productsview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Order placed",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  Get.offAll(ProductList());
                },
                icon: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber[400], // Background color
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                      border:
                          Border.all(color: Colors.black, width: 1), // Border
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 14,
                        ),
                      ], // Shadow
                    ),
                    child: const Text(
                      "Go to Home",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      ),
    );
  }
}
