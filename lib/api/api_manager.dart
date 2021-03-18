import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ifridgev2/api/models/recipe_model.dart';
import 'package:ifridgev2/api/api_urls.dart';

import 'models/recipe_instruction_model.dart';

class ApiManager {
  Future<List<RecipeModel>> getIngredients() async {
    var client = http.Client();
    var recipesModel;
    // FoodDatabaseService foodDatabaseService = FoodDatabaseService();
    // // Going to substitute for getting all food items of that user
    // List<String> food = await foodDatabaseService.getIngredient();
    // String foodString = '';
    // food.forEach((element) {
    //   foodString += element + ',+';
    // });
    // foodString = foodString.substring(0, foodString.length - 2);
    // String finalString =
    //     'https://api.spoonacular.com/recipes/findByIngredients?ingredients=' +
    //         foodString +
    //         '&number=10&apiKey=f4fd5002222b4e9eb0f35956381904f0';
    String finalString = await Url.getRecipes();
    final response = await client.get(finalString);
    if (response.statusCode == 200) {
      var jsonBody = response.body;
      recipesModel = apiModelFromJson(jsonBody);
    } else {
      return recipesModel;
    }
    return recipesModel;
  }

  Future<RecipeInstructionModel> getRecipe(int id) async {
    var client = http.Client();
    var recipe;

    final response = await client.get(Url.recipeUrl(id));
    if (response.statusCode == 200) {
      var jsonBody = response.body;
      var jsonMap = json.decode(jsonBody);
      var len = jsonMap.length;
      if (!jsonMap.isEmpty) {
        if (len > 1) {
          recipe = RecipeInstructionModel.fromJson(jsonMap[1]);
        } else {
          recipe = RecipeInstructionModel.fromJson(jsonMap[0]);
        }
      } else {
        var jsonMock = '{ "steps": [] }';
        var jsonMapMock = json.decode(jsonMock);
        recipe = RecipeInstructionModel.fromJson(jsonMapMock);
      }
    } else {
      return recipe;
    }
    return recipe;
  }
}
