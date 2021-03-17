import 'package:ifridgev2/repository/food_database.dart';

class Url {
  static String url =
      "https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples,+flour,+sugar&number=10&apiKey=f4fd5002222b4e9eb0f35956381904f0";
  static String recipeUrl(int id) {
    String url = 'https://api.spoonacular.com/recipes/' +
        id.toString() +
        '/analyzedInstructions?apiKey=f4fd5002222b4e9eb0f35956381904f0';
    return url;
  }

  static Future<String> getRecipes() async {
    FoodDatabaseService foodDatabaseService = FoodDatabaseService();
    // Going to substitute for getting all food items of that user
    List<String> food = await foodDatabaseService.getIngredient();
    String foodString = '';
    food.forEach((element) {
      foodString += element + ',+';
    });
    foodString = foodString.substring(0, foodString.length - 2);
    String finalString =
        'https://api.spoonacular.com/recipes/findByIngredients?ingredients=' +
            foodString +
            '&number=10&apiKey=f4fd5002222b4e9eb0f35956381904f0';
    return finalString;
  }

  static String setUrl(List ingredients) {
    String url =
        "https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples,+flour,+sugar&number=10&apiKey=f4fd5002222b4e9eb0f35956381904f0";
    return url;
  }
}
