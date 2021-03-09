import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ifridgev2/api/api_model.dart';
import 'package:ifridgev2/api/api_urls.dart';

class ApiManager {
  Future<List<ApiModel>> getIngredients() async {
    var client = http.Client();
    var recipesModel;

    // Going to substitute for getting all food items of that user
    var food = ["apple", "banana", "grape"];

    final response = await http.get(Url.url);
    if (response.statusCode == 200) {
      var jsonBody = response.body;
      recipesModel = apiModelFromJson(jsonBody);
    } else {
      return recipesModel;
    }
    return recipesModel;
  }
}
