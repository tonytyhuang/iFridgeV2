import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ifridgev2/api/api_manager.dart';
import 'package:ifridgev2/api/api_model.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  Future<List<ApiModel>> recipeModel;

  @override
  void initState() {
    super.initState();
    recipeModel = ApiManager().getIngredients();
  }

  // Future<String> getData() async {
  //   http.Response response = await http.get(
  //       Uri.encodeFull(
  //           "https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples,+flour,+sugar&number=10&apiKey=f4fd5002222b4e9eb0f35956381904f0"),
  //       headers: {"Accept": "application/json"});

  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<ApiModel>>(
          future: recipeModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data[index];
                  return Container(
                    height: 133,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            child: Image.network(item.image),
                          ),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 0, left: 15, right: 15),
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
                              Spacer(),
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
                                  'Unused Ingredients: ' +
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
                          )
                        ],
                      ),
                      // child: Image.network(item.image),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
