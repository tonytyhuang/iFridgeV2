import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifridgev2/UI/ShoppingListPage/widget/ShoppingListWidget.dart';
import 'package:ifridgev2/bloc/shopping_list/shopping_list_bloc.dart';
import 'package:ifridgev2/entities/shopping_list_entity.dart';
import 'package:ifridgev2/repository/shopping_list_database.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ShoppingListBloc>(
          create: (context) =>
              ShoppingListBloc(ShoppingListDatabaseService())..add(LoadItem()))
    ], child: ShoppingListChild());
  }
}

class ShoppingListChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f213f),
      body: Column(
        children: [
          SizedBox(
            height: 128,
          ),
          ShoppingListWidget(),
          FlatButton(
              onPressed: () {
                ShoppingListItem shoppingListItem = ShoppingListItem(
                    name: 'Tony', quantity: 1, category: 'Emergency Food');
                BlocProvider.of<ShoppingListBloc>(context)
                  ..add(AddItem(shoppingListItem));
              },
              child: Text('Test'))
        ],
      ),
    );
  }
}
