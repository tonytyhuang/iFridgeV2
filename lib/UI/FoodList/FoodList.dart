import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifridgev2/UI/FoodList/widgets/AllFoodListWidget.dart';
import 'package:ifridgev2/bloc/food/food_bloc.dart';
import 'package:ifridgev2/entities/food_entity.dart';
import 'package:ifridgev2/fake_data/fake_data.dart';
import 'package:ifridgev2/repository/food_database.dart';

class FoodListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<FoodBloc>(
          create: (context) =>
              FoodBloc(FoodDatabaseService())..add(LoadFood(10)))
    ], child: FoodListPageChild());
  }
}

class FoodListPageChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f213f),
      body: Column(
        children: [
          SizedBox(
            height: 128,
          ),
          FoodListWidget(),
          FlatButton(
              onPressed: () {
                Food food = Food(
                    name: 'Tony',
                    quantity: 1,
                    expiryDate: Timestamp.fromDate(DateTime.now()),
                    category: 'Emergency Food');
                BlocProvider.of<FoodBloc>(context)..add(AddFood(food));
              },
              child: Text('Test'))
        ],
      ),
    );
  }
}
