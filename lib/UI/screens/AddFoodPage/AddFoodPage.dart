import 'package:flutter/material.dart';
import './AddFoodForm.dart';

class AddFoodPage extends StatelessWidget {
  static const String _title = 'Add Food';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: AddFoodForm()
    );
  }
}