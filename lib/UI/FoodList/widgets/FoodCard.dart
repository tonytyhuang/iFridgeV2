import 'package:flutter/material.dart';
import 'package:ifridgev2/entities/food_entity.dart';

class FoodCardWidget extends StatelessWidget {
  final Food food;
  FoodCardWidget(this.food);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 0.9 * MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
          Text(food.name),
          SizedBox(width: 20),
          Text(food.quantity.toString()),
          // SizedBox(width: 20),
          // Text(food.expiryDate.toString()),
        ],
      ),
    );
  }
}
