import 'package:flutter/material.dart';
import 'package:shopify_app/model/products_model.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  width: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image(
                    image: NetworkImage(product.imageLink!),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Positioned(
                  bottom: 10,
                  child: Column(
                    children: [
                      Text(
                        product.name!,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  //right: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Row(
                      children: [
                        Text(product.brand!),
                        const SizedBox(
                          width: 50,
                        ),
                        Text('\$${product.price!}'),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
