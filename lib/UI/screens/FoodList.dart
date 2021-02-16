import 'dart:math';

import 'package:flutter/material.dart';

class FoodListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f213f),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 128, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          color: Colors.white,
        ),
        child: Text('test'),
      ),
    );
  }
}
