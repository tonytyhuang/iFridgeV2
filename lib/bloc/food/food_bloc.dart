import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ifridgev2/entities/food_entity.dart';
import 'package:ifridgev2/repository/food_database.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final IFoodDatabase ifoodDatabase;
  FoodBloc(this.ifoodDatabase) : super(FoodInitial());

  @override
  Stream<FoodState> mapEventToState(
    FoodEvent event,
  ) async* {
    if (event is AddFood) {
      yield* _mapFoodAddedEventToState(event, ifoodDatabase.addFood);
    }
  }
}

Stream<FoodState> _mapFoodAddedEventToState(
    AddFood event, Future<String> Function({Food food}) addFood) async* {
  try {
    print('works');
    String id = await addFood(food: event.food);
    yield FoodAdded(id);
  } catch (e) {
    print(e);
    yield FoodError(e);
  }
}
