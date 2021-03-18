import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ifridgev2/entities/shopping_list_entity.dart';
import 'package:ifridgev2/repository/shopping_list_database.dart';

part 'shopping_list_event.dart';
part 'shopping_list_state.dart';

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  final IShoppingListDatabase ishoppingListDatabse;
  ShoppingListBloc(this.ishoppingListDatabse)
      : super(ShoppingListState.initial());

  @override
  Stream<ShoppingListState> mapEventToState(
    ShoppingListEvent event,
  ) async* {
    if (event is AddItem) {
      yield* _mapAddItemEventToState(
          event, state, ishoppingListDatabse.addItem);
    } else if (event is LoadItem) {
      yield* _mapLoadItemEventToState(
          event, state, ishoppingListDatabse.getShoppingList);
    }
  }
}

Stream<ShoppingListState> _mapAddItemEventToState(
    AddItem event,
    ItemState state,
    Future<String> Function({ShoppingListItem shoppingItem}) addItem) async* {
  try {
    await addItem(shoppingItem: event.shoppingItem);
    List<ShoppingListItem> shoppingList = state.shoppingList;
    if (shoppingList != null) {
      shoppingList.add(event.shoppingItem);
    }
    yield state.copyWith(shoppingList: shoppingList);
  } catch (e) {
    print(e);
    yield state.copyWith(error: e);
  }
}

Stream<ShoppingListState> _mapLoadItemEventToState(
    LoadItem event,
    ItemState state,
    Future<List<ShoppingListItem>> Function() getShoppingList) async* {
  try {
    List<ShoppingListItem> shoppingList = await getShoppingList();
    yield state.copyWith(shoppingList: shoppingList);
  } catch (e) {
    print(e);
  }
}
