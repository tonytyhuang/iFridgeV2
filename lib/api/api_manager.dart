import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ifridgev2/api/models/recipe_model.dart';
import 'package:ifridgev2/api/api_urls.dart';

import 'models/recipe_instruction_model.dart';

class ApiManager {
  Future<List<RecipeModel>> getIngredients() async {
    var client = http.Client();
    var recipesModel;

    // Going to substitute for getting all food items of that user
    var food = ["apple", "banana", "grape"];

    final response = await client.get(Url.url);
    if (response.statusCode == 200) {
      var jsonBody = response.body;
      recipesModel = apiModelFromJson(jsonBody);
    } else {
      return recipesModel;
    }
    return recipesModel;
  }

  Future<RecipeInstructionModel> getRecipe() async {
    var client = http.Client();
    var recipe;

    final response = await client.get(Url.recipeUrl);
    if (response.statusCode == 200) {
      var jsonBody = response.body;
      var jsonMap = json.decode(jsonBody);
      recipe = RecipeInstructionModel.fromJson(jsonMap[0]);
    } else {
      return recipe;
    }
    return recipe;
  }
}
