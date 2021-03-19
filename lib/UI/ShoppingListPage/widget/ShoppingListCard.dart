import 'package:flutter/material.dart';
import 'package:ifridgev2/entities/shopping_list_entity.dart';

class ShoppingListCardWidget extends StatelessWidget {
  final ShoppingListItem shoppingListItem;
  ShoppingListCardWidget(this.shoppingListItem);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(8.0),
      width: 0.9 * MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            blurRadius: 8.0,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Container(child: shoppingListIcon(shoppingListItem.category)),
          SizedBox(width: 40),
          Container(child: Text(shoppingListItem.name)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Text(food.quantity.toString()),
                  Container(child: Text('hi')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget shoppingListIcon(String category) {
  if (category != null) {
    return Container(
      child: Icon(
        Icons.food_bank,
        size: 35,
      ),
    );
  }
}
