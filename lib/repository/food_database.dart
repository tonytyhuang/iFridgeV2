import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFoodDatabase {
  Future<void> test();
}

class FoodDatabaseService implements IFoodDatabase {
  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('food');

  @override
  Future<void> test() {
    print('test works');
  }
}
