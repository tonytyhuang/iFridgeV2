import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ifridgev2/api/api_manager.dart';
import 'package:ifridgev2/api/api_model.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  Future<ApiModel> recipeModel;

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
        child: FutureBuilder<ApiModel>(
          future: recipeModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: Image.network(snapshot.data.image),
                    );
                  });
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
