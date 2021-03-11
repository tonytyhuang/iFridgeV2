import 'package:flutter/material.dart';
import 'package:ifridgev2/api/api_manager.dart';
import 'package:ifridgev2/api/models/recipe_instruction_model.dart';
import 'package:ifridgev2/api/models/recipe_model.dart';

class RecipeCard extends StatefulWidget {
  @override
  _RecipeCardState createState() => _RecipeCardState();
  final int id;
  final String name;
  final List<String> ingredients;
  RecipeCard(
      {@required this.id, @required this.name, @required this.ingredients});
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: FutureBuilder<RecipeInstructionModel>(
              future: recipe,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var item = snapshot.data;
                  return Container(
                    // Background for the home page
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 30, right: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 20, right: 10),
                          child: Text(
                            'Ingredients',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 30, top: 10, right: 10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.ingredients.length,
                            itemBuilder: (context, index) {
                              var item = widget.ingredients[index];
                              return Row(
                                children: [
                                  Container(
                                    height: 30,
                                    child: Icon(
                                      Icons.stop_circle,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                                  Text(
                                    '   ' + item,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
