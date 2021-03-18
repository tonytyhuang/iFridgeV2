part of 'shopping_list_bloc.dart';

@immutable
abstract class ShoppingListEvent extends Equatable {
  const ShoppingListEvent();
}

class AddItem extends ShoppingListEvent {
  final ShoppingListItem shoppingItem;

  AddItem(this.shoppingItem);

  @override
  List<Object> get props => [shoppingItem];
}

class LoadItem extends ShoppingListEvent {
  LoadItem();
  @override
  List<Object> get props => [];
}
