import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_2/views/product_screen.dart';

import '../model/product_model.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.page});
  final int page;
  static const route = 'products-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Text("Page $page"),
          const SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final details = ProductModel.create('$index');
                return GestureDetector(
                  onTap: () {
                    context.goNamed(
                      ProductScreen.route,
                      pathParameters: {"id": "$index"},
                      extra: details,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300,
                    ),
                    child: Center(child: Text("Product $index")),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
