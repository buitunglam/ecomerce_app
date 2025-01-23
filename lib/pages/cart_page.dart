import 'package:ecomerce_app/components/my_button.dart';
import 'package:ecomerce_app/components/my_drawer.dart';
import 'package:ecomerce_app/models/product.dart';
import 'package:ecomerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void onDeleteItemCart(BuildContext context, Product item) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("remove this item to your card?"),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () => {
                    Navigator.pop(context),
                    context.read<Shop>().removeFromCart(item)
                  },
                  child: Text("Yes"),
                )
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("cart page"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? Center(
                      child: Text("Your cart is empty"),
                    )
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // get individual item in cart
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                              onPressed: () => onDeleteItemCart(context, item),
                              icon: Icon(Icons.remove)),
                        );
                        // return as a cart tile
                      })),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context), child: Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}
