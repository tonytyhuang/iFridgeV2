import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifridgev2/bloc/food/food_bloc.dart';
import 'package:ifridgev2/entities/food_entity.dart';

class AddFoodForm extends StatefulWidget {
  @override
  _AddFoodFormState createState() => _AddFoodFormState();
}

class _AddFoodFormState extends State<AddFoodForm> {
  final Key _formKey = GlobalKey<FormState>();
  String name;
  String category;
  int quantity;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter some Text';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter some Text';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  quantity = int.parse(value);
                });
              },
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Enter some Text';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  category = value;
                });
              },
            ),
            FlatButton(
              onPressed: () {
                Food food = Food(
                    name: name,
                    quantity: quantity,
                    expiryDate: Timestamp.fromDate(DateTime.now()),
                    category: category);
                BlocProvider.of<FoodBloc>(context)..add(AddFood(food));
              },
              child: Text('submit'))
          ],
        ));
  }
}
