import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ifridgev2/repository/food_database.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final IFoodDatabase foodDatabase;
  FoodBloc(this.foodDatabase) : super(FoodInitial());

  @override
  Stream<FoodState> mapEventToState(
    FoodEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
