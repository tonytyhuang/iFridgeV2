import 'package:flutter/material.dart';
import 'package:ifridgev2/entities/food_entity.dart';

class FoodCardWidget extends StatelessWidget {
  final Food food;
  FoodCardWidget(this.food);
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
          Container(child: foodIcon(food.category)),
          SizedBox(width: 40),
          Container(child: Text(food.name)),
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

Widget foodIcon(String category) {
  if (category == 'Emergency Food') {
    return Container(
      child: Icon(
        Icons.food_bank,
        size: 35,
      ),
    );
  }
}
