import 'package:dara_store/routes.dart';
import 'package:dara_store/screens/sign_in/sign_in_screen.dart';
import 'package:dara_store/screens/splash/splash_screen.dart';
import 'package:dara_store/theme.dart';
import 'package:dara_store/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('box4');
  await Hive.openBox('fav4');
  retriveData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      // initialRoute: SplashScreen.routeName,
      initialRoute: SignInScreen.routeName,
      // Navigator.pushNamed(context, SignInScreen.routeName);
      routes: routes,
    );
  }
}
