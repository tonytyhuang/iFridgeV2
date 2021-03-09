part of 'food_bloc.dart';

@immutable
class FoodState extends Equatable {
  final List<Food> foodList;
  final String error;

  FoodState({this.foodList, this.error});

  factory FoodState.initial() {
    return FoodState(foodList: null, error: null);
  }
  FoodState copyWith({List<Food> foodList, String error}) {
    return FoodState(
        foodList: foodList ?? this.foodList, error: error ?? this.error);
  }

  @override
  List<Object> get props => [foodList];
}
