import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

bool isProductSelected = false;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Your Cart",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ),
            isProductSelected
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LoadedCartCard(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: noItemInCart(),
                  ),
          ],
        ),
      ),
    );
  }

//making card to show notfification of no item in cart
  Card noItemInCart() {
    return Card(
      elevation: 4,
      color: Colors.pink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "😊",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "You do not have any item in the cart yet",
              style: TextStyle(fontSize: 16),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}

class LoadedCartCard extends StatelessWidget {
  const LoadedCartCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey,
      color: Colors.pink,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(
              image: AssetImage("assets/images/logo.png"),
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [const Text("mableline"), Container()],
            ),
            const SizedBox(
              width: 80,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("N20"),
            ),
            const Text("na text ooooooooo")
          ],
        ),
      ),
    );
  }
}
