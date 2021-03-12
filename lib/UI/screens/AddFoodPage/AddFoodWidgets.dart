import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodRow extends StatelessWidget {
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 50,
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
          Expanded(
            flex: 5,
            child: SizedBox()
          ),
          Expanded(
            flex: 25,
            child: Container(
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
          )

        ]
    );
  }
}