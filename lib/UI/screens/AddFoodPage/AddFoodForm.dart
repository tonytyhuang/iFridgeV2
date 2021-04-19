import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifridgev2/bloc/food/food_bloc.dart';
import 'package:ifridgev2/entities/food_entity.dart';

class AddFoodForm extends StatefulWidget {
  @override
  _AddFoodFormState createState() => _AddFoodFormState();
}

class _AddFoodFormState extends State<AddFoodForm> {
  final _formKey = GlobalKey<FormState>();
  List<Map> FoodData;

  createBaseDate() {
    return {"name":"", "quantity":0,"expiryDate":Timestamp.fromDate(DateTime.now()), "category":"Other"};
  }

  _AddFoodFormState() {
    FoodData = [createBaseDate()];
  }

  addFoodRow() {
    setState(() {
      FoodData.add(createBaseDate());
    });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: FoodData.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 50,
                                        child:
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Grocery Item',
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter an item';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              FoodData[index]["name"] = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                          flex: 5,
                                          child: SizedBox()
                                      ),
                                      Expanded(
                                          flex: 25,
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              hintText: '#',
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Quantity Required';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                FoodData[index]["quantity"] = int.parse(value);
                                              });
                                            },
                                          )
                                      )
                                    ]
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        FoodData.removeAt(index);
                                      });
                                    },
                                  )
                                )
                              ]
                            );
                          }
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  for (Map item in FoodData) {
                    print(item);
                    Food food = Food(
                      name: item["name"],
                      quantity: item["quantity"],
                      expiryDate: item["expiryDate"],
                      category: item["category"],
                    );
                    BlocProvider.of<FoodBloc>(context)..add(AddFood(food));
                  }
                }
              }
            ),
            RaisedButton(
                onPressed: addFoodRow,
                child: new Text('Add Item')
            )
          ]
        )
      ]
    );
  }
}


