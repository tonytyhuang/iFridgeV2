import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodRow extends StatelessWidget {
  Widget build(BuildContext context) {
    double twidth = MediaQuery.of(context).size.width;

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: twidth * 0.6,
            child:
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Grocery Item',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter an item';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: twidth * 0.1,
          ),
          Container(
              width: twidth * 0.2,
              child:
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '#',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a Quantity';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              )
          )
        ]
    );
  }
}