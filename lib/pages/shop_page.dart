import 'package:ecomerce_app/components/my_drawer.dart';
import 'package:ecomerce_app/components/my_product_tile.dart';
import 'package:ecomerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Page"),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart_page"),
              icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          // shop title
          Center(
            child: Text("SHOP"),
          ),

          // shop subtitle

          // product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              padding: EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProductTile(product: product);
              },
            ),
          )
        ],
      ),
    );
  }
}
