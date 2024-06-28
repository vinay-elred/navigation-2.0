import 'package:flutter/material.dart';
import 'package:navigation_2/model/product_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.details});
  final ProductModel details;
  static const route = 'product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Product ${details.id}",
              style: const TextStyle(fontSize: 50),
            ),
            Text('Price: ${details.price}'),
            Text('Sold: ${details.sold}'),
            Text('Liked: ${details.liked}')
          ],
        ),
      ),
    );
  }
}
