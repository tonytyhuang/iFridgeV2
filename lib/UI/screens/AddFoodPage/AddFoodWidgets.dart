import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodRow extends StatefulWidget {
  @override
  _FoodRowState createState() => _FoodRowState();
}

class _FoodRowState extends State<FoodRow> {
  String name;
  int quantity;

  @override

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
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: SizedBox()
        ),
        Expanded(
          flex: 25,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: '#',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Quantity Required';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {
              setState(() {
                quantity = int.parse(value);
              });
            },
          )
        )
      ]
    );
  }
}