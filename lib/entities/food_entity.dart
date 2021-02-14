import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Food {
  final String name;
  final int quantity;
  final Timestamp expiryDate;

  Food(
      {@required this.name,
      @required this.quantity,
      @required this.expiryDate});
}
