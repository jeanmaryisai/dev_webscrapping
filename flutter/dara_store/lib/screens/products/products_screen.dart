import 'package:dara_store/repo.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import '../../models/Product.dart';
import '../../utils.dart';
import '../home/components/drawer.dart';
import 'components/body.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName = "/products";
  final String filter;

  const ProductsScreen({super.key, this.filter = 'all'});

  @override
  Widget build(BuildContext context) {
    List<Product> produire = demoProducts;
    var title = "Pwodwi";
    if (filter != "all") {
      title = "Pwodwi | $filter";
      demoCategories.forEach((element) {
        if (element.category == "filter") {
          produire = getProductsByCategory(element);
        }
      });
    }
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Muli',
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Body(list:produire),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
