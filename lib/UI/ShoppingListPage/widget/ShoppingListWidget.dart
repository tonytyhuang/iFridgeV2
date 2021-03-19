import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifridgev2/UI/ShoppingListPage/widget/ShoppingListCard.dart';
import 'package:ifridgev2/bloc/shopping_list/shopping_list_bloc.dart';

class ShoppingListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingListBloc, ShoppingListState>(
       listener: (BuildContext context, ShoppingListState state) {},
      builder: (BuildContext context, ShoppingListState state) {
        if (state.shoppingList != null) {
          return Expanded(
              child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              color: Color(0xFF233168),
            ),
            child: Stack(children: [
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.shoppingList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        ShoppingListCardWidget(state.shoppingList[index])),
              ),
            ]),
          ));
        } else if (state.error != null) {
          return Text(state.error);
        } else {
          return Text("Unknown Error");
        }
      },
    );

  }
}
