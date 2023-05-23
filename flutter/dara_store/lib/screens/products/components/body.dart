import 'package:flutter/material.dart';

import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../../repo.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  final List<Product> list;

  const Body({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      padding: EdgeInsets.all(0),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final product = list[index];

        return Column(
          children: [
            ProductCard(product: list[index], fav: () {}),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
          ],
        );
      },
    );
  }
}
