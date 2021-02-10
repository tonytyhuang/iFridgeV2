part of 'food_bloc.dart';

@immutable
abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class GetInitialFood extends FoodEvent {
  final int limit;

  GetInitialFood(this.limit);

  @override
  List<Object> get props => [limit];
}