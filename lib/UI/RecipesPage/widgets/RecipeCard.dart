import 'package:flutter/material.dart';
import 'package:ifridgev2/api/api_manager.dart';
import 'package:ifridgev2/api/models/recipe_instruction_model.dart';
import 'package:ifridgev2/api/models/recipe_model.dart';

class RecipeCard extends StatefulWidget {
  @override
  _RecipeCardState createState() => _RecipeCardState();
  final int id;
  RecipeCard({@required this.id});
}

class _RecipeCardState extends State<RecipeCard> {
  Future<RecipeInstructionModel> recipe;

  @override
  void initState() {
    super.initState();
    recipe = ApiManager().getRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<RecipeInstructionModel>(
            future: recipe,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var item = snapshot.data;
                return Text(item.name);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
