import 'package:flutter/material.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import '../../repo.dart';
import 'components/body.dart';

class FavScreen extends StatelessWidget {
  static String routeName = "/fav";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Saw anvi",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoFav.length} pwodwi",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}