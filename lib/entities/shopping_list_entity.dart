import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ShoppingListItem {
  final String name;
  final int quantity;
  final String category;

  ShoppingListItem(
      {@required this.name, @required this.quantity, @required this.category});
}
