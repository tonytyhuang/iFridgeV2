part of 'food_bloc.dart';

@immutable
abstract class FoodState extends Equatable {}

class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodAdded extends FoodState {
  final String foodId;

  FoodAdded(this.foodId);
  @override
  List<Object> get props => [foodId];
}

class FoodError extends FoodState {
  final String message;

  FoodError(this.message);

  @override
  List<Object> get props => [message];
}
