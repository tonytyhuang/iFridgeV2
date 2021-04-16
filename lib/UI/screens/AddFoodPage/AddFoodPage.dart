import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './AddFoodForm.dart';
import 'package:ifridgev2/bloc/food/food_bloc.dart';
import 'package:ifridgev2/repository/food_database.dart';

class AddFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodBloc>(
      create: (context) => FoodBloc(FoodDatabaseService()),
      child: AddFoodForm(),
    );
  }
}