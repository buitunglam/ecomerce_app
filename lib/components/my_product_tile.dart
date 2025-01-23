import 'package:ecomerce_app/models/product.dart';
import 'package:flutter/material.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(Icons.favorite),
          Text(product.name),
          Text(product.description)
        ],
      ),
    );
  }
}
