import 'package:flutter/material.dart';
import 'package:dara_store/components/default_button.dart';
import 'package:dara_store/screens/home/home_screen.dart';
import 'package:dara_store/size_config.dart';

import '../../../repo.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name= currentUser.name;
    return Center(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4, //40%
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Byenvini $name",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Ale nan paj akey la",
              press: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
