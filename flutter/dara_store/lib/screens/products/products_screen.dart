import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import '../home/components/drawer.dart';
import 'components/body.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName = "/products";
  final String filter;

  const ProductsScreen({super.key, this.filter='all'});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pwodwi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Muli',),
        ),
      ),
      drawer: MyDrawer(),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}