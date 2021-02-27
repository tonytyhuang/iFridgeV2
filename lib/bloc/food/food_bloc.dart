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
  FoodBloc(this.ifoodDatabase) : super(FoodState.initial());

  @override
  Stream<FoodState> mapEventToState(
    FoodEvent event,
  ) async* {
    if (event is AddFood) {
      yield* _mapAddFoodEventToState(event, state, ifoodDatabase.addFood);
    } else if (event is LoadFood) {
      yield* _mapLoadFoodEventToState(event, state, ifoodDatabase.getFoodList);
    }
  }
}

Stream<FoodState> _mapAddFoodEventToState(AddFood event, FoodState state,
    Future<String> Function({Food food}) addFood) async* {
  try {
    await addFood(food: event.food);
    List<Food> foodList = state.foodList;
    if (foodList != null) {
      foodList.add(event.food);
    }
    yield state.copyWith(foodList: foodList);
  } catch (e) {
    print(e);
    yield state.copyWith(error: e);
  }
}

Stream<FoodState> _mapLoadFoodEventToState(LoadFood event, FoodState state,
    Future<List<Food>> Function({int limit}) getFoodList) async* {
  try {
    List<Food> foodList = await getFoodList(limit: event.limit);
    yield state.copyWith(foodList: foodList);
  } catch (e) {
    print(e);
  }
}
