import 'package:flutter/material.dart';
import 'package:ifridgev2/api/api_manager.dart';
import 'package:ifridgev2/api/models/recipe_model.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  Future<List<RecipeModel>> recipeModel;

  @override
  void initState() {
    super.initState();
    // call the api to get the recipes
    recipeModel = ApiManager().getIngredients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<RecipeModel>>(
          future: recipeModel,
          builder: (context, snapshot) {
            // Check whether the api has made the call or not
            if (snapshot.hasData) {
              // Building each recipe as a list
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data[index];
                  List<String> ingredients = [];
                  for (int i = 0; i < item.missedIngredientCount; ++i) {
                    ingredients.add(item.missedIngredients[i].original);
                  }
                  for (int i = 0; i < item.usedIngredientCount; ++i) {
                    ingredients.add(item.usedIngredients[i].original);
                  }
                  return Container(
                    height: 133,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/recipe', arguments: {
                          'itemID': item.id,
                          'itemName': item.title,
                          'itemIngredients': ingredients,
                        });
                      },
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10),
                              child: Image.network(item.image),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 15,
                                          right: 15),
                                      child: Text(
                                        item.title,
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 0, left: 15, right: 15),
                                    child: Text(
                                      'Used Ingredients: ' +
                                          item.usedIngredientCount.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 0, left: 15, right: 15),
                                    child: Text(
                                      'Missed Ingredients: ' +
                                          item.missedIngredientCount.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 0, left: 15, right: 15),
                                    child: Text(
                                      'Likes: ' + item.likes.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
              // Check if error occured when api was called
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // Returns loading spinner when waiting for api call
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
