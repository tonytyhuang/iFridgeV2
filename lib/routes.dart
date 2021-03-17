import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/FoodList/FoodList.dart';
import 'package:ifridgev2/UI/screens/login.dart';
import 'package:ifridgev2/UI/screens/navbar.dart';
import 'package:ifridgev2/UI/RecipesPage/Recipes.dart';
import 'package:ifridgev2/UI/RecipesPage/widgets/RecipeCard.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => NavBar());
      case '/test':
        return MaterialPageRoute(builder: (_) => FoodListPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => NavBar());
      case '/recipe':
        Map args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => RecipeCard(
            id: args['itemID'],
            name: args['itemName'],
            ingredients: args['itemIngredients'],
            item: args['item'],
          ),
        );
    }
  }
}
