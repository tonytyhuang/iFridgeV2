import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/FoodList/widgets/AllFoodListWidget.dart';
import 'package:ifridgev2/fake_data/fake_data.dart';

class FoodListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f213f),
      body: Column(
        children: [
          SizedBox(
            height: 128,
          ),
          FoodListWidget(
            foodList: getFoodList(),
          ),
        ],
      ),
    );
  }
}
