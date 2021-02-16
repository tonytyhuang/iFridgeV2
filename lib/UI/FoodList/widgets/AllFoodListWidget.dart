import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/FoodList/widgets/FoodCard.dart';
import 'package:ifridgev2/entities/food_entity.dart';

class FoodListWidget extends StatelessWidget {
  final List<Food> foodList;
  FoodListWidget({this.foodList});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          // BorderRadius.only(
          //     topLeft: Radius.circular(32),
          //     topRight: Radius.circular(32)),
          color: Colors.white,
        ),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: foodList.length,
              itemBuilder: (BuildContext context, int index) =>
                  FoodCardWidget(foodList[index])),
        ),
      ),
    );
  }
}
