import 'package:ecommerce/screens/splash/sign_in/sign_in_screen.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: ((context) => const SignInScreen()),
};
