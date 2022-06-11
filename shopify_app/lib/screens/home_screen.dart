import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopify_app/GetXPackage/Controllers/product_controllers.dart';
import 'package:get/get.dart';
import 'package:shopify_app/screens/cart_screen.dart';
import 'package:shopify_app/screens/product_details.dart';
import 'package:shopify_app/widgets/products_tile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  myBottomSheet(context);
                },
                icon: const Icon(Icons.menu),
                color: Colors.pink,
              ),
              const Text(
                "ShopyGirl",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => const CartScreen());
                },
                icon: const Icon(Icons.shopping_cart),
                color: Colors.pink,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Welcome Home Beautiful..",
              style: TextStyle(color: Colors.purple),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Hero(
              tag: 'dash',
              child: Obx(() {
                if (productController.isLoading.isTrue) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return AlignedGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      itemCount: productController.productList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => ProductDetails(
                                  product: productController.productList[index],
                                ));
                          },
                          child: ProductTile(
                            product: productController.productList[index],
                          ),
                        );
                      });
                }
              }),
            ),
          )
        ]),
      ),
    );
  }

  myBottomSheet(BuildContext context) {
    return showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Scaffold(
          body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text("hello world"),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CircleAvatar(
                radius: 30,
                //backgroundColor: Colors.blue,
              ),
              CircleAvatar(
                radius: 30,
                // backgroundColor: Colors.blue,
              ),
              CircleAvatar(
                radius: 30,
                //  backgroundColor: Colors.blue,
              ),
              CircleAvatar(
                radius: 30,
                // backgroundColor: Colors.blue,
              ),
              CircleAvatar(
                radius: 30,
                // backgroundColor: Colors.blue,
              ),
            ],
          )
        ],
      )),
    );
  }
}
