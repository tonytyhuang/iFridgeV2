import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/screens/FoodList.dart';
import 'package:ifridgev2/UI/screens/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());
      case '/test':
        return MaterialPageRoute(builder: (_) => FoodListPage());
    }
  }
}
