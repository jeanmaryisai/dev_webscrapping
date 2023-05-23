import 'package:dara_store/screens/home/components/special_offers.dart';
import 'package:flutter/material.dart';

import '../../repo.dart';
import '../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      padding: EdgeInsets.all(8),
      itemCount: demoCategories.length,
      itemBuilder: (context, index) {

        return Column(
          children: [
            SpecialOfferCard(category: demoCategories[index]),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
          ],
        );
      },
    );
  }
}