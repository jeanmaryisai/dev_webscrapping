import 'package:dara_store/screens/cart/cart_screen.dart';
import 'package:dara_store/screens/complete_profile/complete_profile_screen.dart';
import 'package:dara_store/screens/details/details_screen.dart';
import 'package:dara_store/screens/favourites/favourites_screen.dart';
import 'package:dara_store/screens/forgot_password/forgot_password_screen.dart';
import 'package:dara_store/screens/home/home_screen.dart';
import 'package:dara_store/screens/login_success/login_success_screen.dart';
import 'package:dara_store/screens/otp/otp_screen.dart';
import 'package:dara_store/screens/products/products_screen.dart';
import 'package:dara_store/screens/profile/profile_screen.dart';
import 'package:dara_store/screens/sign_in/sign_in_screen.dart';
import 'package:dara_store/screens/sign_up/sign_up_screen.dart';
import 'package:dara_store/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  FavScreen.routeName: (context) => FavScreen(),
  ProductsScreen.routeName: (context) => ProductsScreen(),
};
