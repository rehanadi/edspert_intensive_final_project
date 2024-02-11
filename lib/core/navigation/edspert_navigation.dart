import 'package:flutter/material.dart';
import 'package:edspert_intensive_final_project/screen/content/detail_content_screen.dart';
import 'package:edspert_intensive_final_project/screen/menu/home_screen.dart';
import 'package:edspert_intensive_final_project/screen/splash_screen.dart';
import 'package:edspert_intensive_final_project/screen/auth/login_screen.dart';
import 'package:edspert_intensive_final_project/screen/auth/register_screen.dart';

class EdspertNavigation {
  // Use navigator without context
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Register routes
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    RegisterScreen.routeName: (context) => const RegisterScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    DetailContentScreen.routeName: (context) => const DetailContentScreen(),
  };

  void push(Widget widget) {
    navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => widget));
  }

  void pushNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }

  void popUntil(String routeName) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }
}