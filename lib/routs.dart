
import 'package:ecommerce/home_screen/home_screen.dart';
import 'package:ecommerce/sign_up/complete_profile.dart';
import 'package:ecommerce/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/forget_password/forget_password_screen.dart';
import 'package:ecommerce/home_screen/drawer_screen.dart';
import 'package:ecommerce/home_screen/home_page.dart';
import 'package:ecommerce/log%20in/sign_in_screen.dart';
import 'package:ecommerce/log%20in/sign_in_success.dart';
import 'package:ecommerce/sign_up/signup_screen.dart';

final Map<String,WidgetBuilder> routes = {
  SplashScreen.routeName: (context)=> SplashScreen(),
  SignInScreen.routeName: (context)=> SignInScreen(),
  ForgotPasswordScreen.routeName: (context)=> ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context)=> LoginSuccessScreen(),
  HomeScreen.routeName: (context)=> HomeScreen(),
  SignUpScreen.routeName: (context)=> SignUpScreen(),
  CompleteProfileScreen.routeNamed: (context)=> CompleteProfileScreen(),
  HomePage.routeName: (context)=> HomePage(),
  DrawerScreen.routeName: (context)=> DrawerScreen(),
} ;
