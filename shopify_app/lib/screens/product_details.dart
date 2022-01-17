import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_app/model/products_model.dart';
import 'package:shopify_app/screens/home_screen.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // const SizedBox(
              //   height: 20,
              // ),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: 'dash',
                  child: Image(
                    image: NetworkImage(
                      product.imageLink!,
                    ),
                    height: 240,
                    width: 280,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.name!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Brand: ${product.brand!}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    // Text(product.currency.toString()),
                    Card(
                        shadowColor: Colors.grey,
                        elevation: 2,
                        color: Colors.pink,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\$${product.price!}',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //Text(product.category.toString()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.description.toString(),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16),
                ),
              ),

              // const SizedBox(
              //   height: 20,
              // ),
              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => HomeScreen());
                    },
                    child: const Text('Add to Cart',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
