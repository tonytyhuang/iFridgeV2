import 'dart:math';

import 'package:flutter/material.dart';

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
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                // BorderRadius.only(
                //     topLeft: Radius.circular(32),
                //     topRight: Radius.circular(32)),
                color: Colors.white,
              ),
              child: Text('test'),
            ),
          ),
        ],
      ),
    );
  }
}
