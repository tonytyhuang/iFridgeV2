part of 'shopping_list_bloc.dart';

@immutable
class ShoppingListState extends Equatable {
  final List<ShoppingListItem> shoppingList;
  final String error;

  ShoppingListState({this.shoppingList, this.error});

  factory ShoppingListState.initial() {
    return ShoppingListState(shoppingList: null, error: null);
  }
  ShoppingListState copyWith(
      {List<ShoppingListItem> shoppingList, String error}) {
    return ShoppingListState(
        shoppingList: shoppingList ?? this.shoppingList,
        error: error ?? this.error);
  }

  @override
  List<Object> get props => [shoppingList];
}
