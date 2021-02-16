import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifridgev2/entities/food_entity.dart';

abstract class IFoodDatabase {
  Future<void> test();

  Future<List<Food>> getFoodList({String userId});
}

class FoodDatabaseService implements IFoodDatabase {
  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('food');

  @override
  Future<void> test() {
    print('test works');
  }

  @override
  Future<List<Food>> getFoodList({String userId, int limit}) async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await foodCollection.doc(userId).get();
    } catch (e) {
      print(e);
    }
  }
}
