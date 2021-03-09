part of 'food_bloc.dart';

@immutable
abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class AddFood extends FoodEvent {
  final Food food;

  AddFood(this.food);

  @override
  List<Object> get props => [food];
}

class LoadFood extends FoodEvent {
  final int limit;
  LoadFood(this.limit);
  @override
  List<Object> get props => [limit];
}
