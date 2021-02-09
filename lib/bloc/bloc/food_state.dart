part of 'food_bloc.dart';

@immutable
abstract class FoodState extends Equatable {}

class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}
