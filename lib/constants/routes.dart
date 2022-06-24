import 'package:arishti_chatroom/pages/HomePage.dart';
import 'package:arishti_chatroom/pages/LoginPage.dart';
import 'package:arishti_chatroom/pages/RegistrationPage.dart';
import 'package:arishti_chatroom/pages/WelcomePage.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String splashScreen = "/";
  static const String welcome = "/welcome";
  static const String homePage = "/home";
  static const String loginPage = "/login";
  static const String registrationPage = "/register";

  static final routes = <String, WidgetBuilder>{
    welcome: (BuildContext context) => const WelcomePage(),
    homePage: (BuildContext context) => const HomePage(),
    loginPage: (BuildContext context) => const LoginPage(),
    registrationPage: (BuildContext context) => const RegistrationPage(),
  };
}
