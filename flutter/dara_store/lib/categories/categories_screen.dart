import 'package:flutter/material.dart';

import '../components/coustom_bottom_nav_bar.dart';
import '../enums.dart';
import '../screens/home/components/drawer.dart';
import '../size_config.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = "/categories";
  final String filter;

  const CategoriesScreen({super.key, this.filter='all'});

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