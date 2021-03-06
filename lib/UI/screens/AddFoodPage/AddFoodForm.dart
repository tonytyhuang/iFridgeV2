import 'package:flutter/material.dart';
import 'package:ifridgev2/entities/food_entity.dart';
import './AddFoodWidgets.dart';

class AddFoodForm extends StatefulWidget {
  @override
  _AddFoodFormState createState() => _AddFoodFormState();
}

class _AddFoodFormState extends State<AddFoodForm> {
  final _formKey = GlobalKey<FormState>();
  List<FoodRow> FoodList = [FoodRow()];
  @override

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  addFoodRow() {
    setState(() {});
    FoodList.add(FoodRow());
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Form(
            key: _formKey,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: FoodList.length,
              itemBuilder: (_, index) => FoodList[index],
            )
          ),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: addFoodRow,
              child: new Text('Add Item')
            )
          ]
        )
      ],
    );
  }
}