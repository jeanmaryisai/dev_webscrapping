import 'package:flutter/material.dart';
import 'package:dara_store/components/coustom_bottom_nav_bar.dart';
import 'package:dara_store/enums.dart';

import '../../size_config.dart';
import '../../utils.dart';
import 'components/body.dart';
import 'components/drawer.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    retriveData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dara Store",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Muli',),
        ),
      ),
      drawer: MyDrawer(),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
