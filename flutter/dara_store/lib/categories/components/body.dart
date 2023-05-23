import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      padding: EdgeInsets.all(8),
      itemCount: demoProducts.length,
      itemBuilder: (context, index) {
        final product = demoProducts[index];

        return ProductCard(product: demoProducts[index], fav: () {});
      },
    );
  }
}