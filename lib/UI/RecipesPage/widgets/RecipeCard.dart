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
  final RecipeModel item;
  RecipeCard(
      {@required this.id,
      @required this.name,
      @required this.ingredients,
      @required this.item});
}

class _RecipeCardState extends State<RecipeCard> {
  Future<RecipeInstructionModel> recipe;
  RecipeModel recipeModel;

  List<Widget> getInfoRow(int totalTime, int totalStep) {
    List<Widget> infoList = [];
    infoList.add(
      Icon(
        Icons.timer,
        color: Colors.black,
        size: 38,
      ),
    );
    if (totalTime == 0) {
      infoList.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Likes",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.item.likes.toString()),
          ],
        ),
      );
    } else {
      infoList.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Time",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(totalTime.toString() + " m")
          ],
        ),
      );
    }

    infoList.add(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ingredients",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(widget.ingredients.length.toString())
        ],
      ),
    );
    infoList.add(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Steps",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(totalStep.toString())
      ],
    ));

    return infoList;
  }

  @override
  void initState() {
    super.initState();
    recipe = ApiManager().getRecipe(widget.id);
    recipeModel = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecipeInstructionModel>(
        future: recipe,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            int totalTime = 0;
            snapshot.data.steps.forEach((element) {
              if (element.length != null) {
                if (element.length.unit == "minutes") {
                  totalTime += element.length.number;
                } else if (element.length.unit == "hours") {
                  totalTime += element.length.number * 60;
                }
              }
            });
            return Scaffold(
              body: Container(
                child: ListView(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          color: Colors.black,
                          width: MediaQuery.of(context).size.width,
                          height: 230,
                          child: ShaderMask(
                            shaderCallback: (rect) {
                              return LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.topCenter,
                                colors: [Colors.black, Colors.transparent],
                              ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height));
                            },
                            blendMode: BlendMode.dstIn,
                            child: FittedBox(
                              child: Image.network(widget.item.image),
                              fit: BoxFit.fitWidth,
                              clipBehavior: Clip.hardEdge,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    widget.name,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            top: 210,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 55,
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.grey[100],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 8.0,
                                    offset: Offset(0, 5),
                                  )
                                ],
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: getInfoRow(
                                      totalTime, snapshot.data.steps.length)),
                            ))
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(48, 48, 48, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Ingredients",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF233168)),
                            ),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.ingredients.length,
                              itemBuilder: (context, index) {
                                String ingredient = widget.ingredients[index];
                                return ingredientCard(
                                    ingredient, context, widget.item);
                              })
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(36, 0, 36, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                            child: Text(
                              "Steps",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF233168)),
                            ),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.steps.length,
                              itemBuilder: (context, index) {
                                var step = snapshot.data.steps[index];
                                return stepCard(step);
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return SafeArea(
                child: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
          }
        });
    //   return SafeArea(
    //     child: Scaffold(
    //       body: Container(
    //         child: FutureBuilder<RecipeInstructionModel>(
    //             future: recipe,
    //             builder: (context, snapshot) {
    //               if (snapshot.hasData) {
    //                 // var item = snapshot.data;
    //                 return Container(
    //                   // Background for the home page
    //                   decoration: BoxDecoration(
    //                     image: DecorationImage(
    //                       alignment: Alignment.topCenter,
    //                       image: AssetImage('assets/images/background.png'),
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                   child: SingleChildScrollView(
    //                     physics: ScrollPhysics(),
    //                     child: Column(
    //                       mainAxisSize: MainAxisSize.min,
    //                       children: [
    //                         Padding(
    //                           padding:
    //                               EdgeInsets.only(left: 20, top: 30, right: 20),
    //                           child: Column(
    //                             children: [
    //                               SizedBox(
    //                                 height: 30,
    //                               ),
    //                               Center(
    //                                 child: Text(
    //                                   widget.name,
    //                                   style: TextStyle(
    //                                       fontWeight: FontWeight.bold,
    //                                       fontSize: 30,
    //                                       color: Colors.white),
    //                                 ),
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                         Padding(
    //                           padding:
    //                               EdgeInsets.only(left: 10, top: 20, right: 10),
    //                           child: Text(
    //                             'Ingredients',
    //                             style: TextStyle(
    //                                 fontWeight: FontWeight.bold,
    //                                 fontSize: 20,
    //                                 color: Colors.white),
    //                           ),
    //                         ),
    //                         Flexible(
    //                           fit: FlexFit.loose,
    //                           child: Padding(
    //                             padding:
    //                                 EdgeInsets.only(left: 30, top: 10, right: 10),
    //                             child: ListView.builder(
    //                               shrinkWrap: true,
    //                               physics: NeverScrollableScrollPhysics(),
    //                               itemCount: widget.ingredients.length,
    //                               itemBuilder: (context, index) {
    //                                 var ingredient = widget.ingredients[index];
    //                                 return Row(
    //                                   children: [
    //                                     Container(
    //                                       height: 30,
    //                                       child: Icon(
    //                                         Icons.stop_circle,
    //                                         color: Colors.white,
    //                                         size: 10,
    //                                       ),
    //                                     ),
    //                                     Flexible(
    //                                       child: Padding(
    //                                         padding: EdgeInsets.only(
    //                                           left: 20,
    //                                         ),
    //                                         child: Text(
    //                                           ingredient,
    //                                           maxLines: 2,
    //                                           softWrap: true,
    //                                           overflow: TextOverflow.clip,
    //                                           style: TextStyle(
    //                                               fontWeight: FontWeight.bold,
    //                                               fontSize: 15,
    //                                               color: Colors.white),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 );
    //                               },
    //                             ),
    //                           ),
    //                         ),
    //                         Padding(
    //                           padding:
    //                               EdgeInsets.only(left: 10, top: 20, right: 10),
    //                           child: Text(
    //                             'Steps',
    //                             style: TextStyle(
    //                                 fontWeight: FontWeight.bold,
    //                                 fontSize: 20,
    //                                 color: Colors.white),
    //                           ),
    //                         ),
    //                         Flexible(
    //                           // fit: FlexFit.loose,
    //                           child: Padding(
    //                             padding:
    //                                 EdgeInsets.only(left: 30, top: 10, right: 10),
    //                             child: Container(
    //                               child: ListView.builder(
    //                                   shrinkWrap: true,
    //                                   physics: NeverScrollableScrollPhysics(),
    //                                   itemCount: snapshot.data.steps.length,
    //                                   itemBuilder: (context, index) {
    //                                     var step = snapshot.data.steps[index];
    //                                     return Container(
    //                                       child: Column(
    //                                         children: [
    //                                           Padding(
    //                                             padding:
    //                                                 EdgeInsets.only(left: 20),
    //                                             child: Text(
    //                                               'Step' + step.number.toString(),
    //                                               style: TextStyle(
    //                                                   color: Colors.white,
    //                                                   fontSize: 15),
    //                                             ),
    //                                           ),
    //                                           Padding(
    //                                             padding: EdgeInsets.only(
    //                                               top: 5,
    //                                               bottom: 5,
    //                                             ),
    //                                             child: Text(
    //                                               step.step,
    //                                               style: TextStyle(
    //                                                   color: Colors.white,
    //                                                   fontSize: 20),
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     );
    //                                   }),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               } else {
    //                 return Center(
    //                   child: CircularProgressIndicator(),
    //                 );
    //               }
    //             }),
    //       ),
    //     ),
    //   );
    // }
  }
}

Widget ingredientCard(
    String ingredient, BuildContext context, RecipeModel item) {
  Color color = Colors.grey[850];
  item.missedIngredients.forEach((element) {
    if (ingredient.contains(element.name)) {
      color = Colors.yellow[600];
    }
  });
  return Container(
    padding: const EdgeInsets.all(8),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.add_circle_rounded,
            color: color,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
            child: Text(
          ingredient,
          style: TextStyle(fontSize: 14),
        ))
      ],
    ),
  );
}

Widget stepCard(dynamic step) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(step.number.toString() + '. ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 16)),
        Expanded(
            child: Text(step.step,
                style: TextStyle(color: Colors.black, fontSize: 16)))
      ],
      // children[]: TextSpan(children: [
      //   TextSpan(
      //       text: step.number.toString() + '. ',
      //       style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           color: Colors.orange,
      //           fontSize: 16)),
      //   TextSpan(
      //       text: step.step,
      //       style: TextStyle(color: Colors.black, fontSize: 16))
      // ]),
    ),
  );
}
