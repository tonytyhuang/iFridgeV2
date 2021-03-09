import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifridgev2/entities/food_entity.dart';

abstract class IFoodDatabase {
  Future<void> test();

  Future<List<Food>> getFoodList({int limit});

  Future<String> addFood({Food food});
}

class FoodDatabaseService implements IFoodDatabase {
  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('food');

  @override
  Future<void> test() {
    print('test works');
  }

  @override
  Future<List<Food>> getFoodList({int limit}) async {
    String fakeId = "Tonydoodoo";
    List<Food> foodList = new List();
    try {
      QuerySnapshot querySnapshot =
          await foodCollection.where("user_id", isEqualTo: fakeId).get();
      if (querySnapshot.docs.length > 0) {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          Map<String, dynamic> json = doc.data();
          final Food food = Food(
              name: json['name'],
              quantity: json['quantity'],
              expiryDate: json['expiry'],
              category: json['category']);
          foodList.add(food);
        }
      } else {
        return foodList;
      }
      return foodList;
    } catch (e) {
      print(e);
    }
    return foodList;
  }

  @override
  Future<String> addFood({Food food}) async {
    String fakeId = "Tonydoodoo";
    try {
      DocumentReference documentReference = await foodCollection.add({
        "user_id": fakeId,
        "name": food.name,
        "quantity": food.quantity,
        "expiry": food.expiryDate,
        "category": food.category,
      });
      return documentReference.id;
    } catch (e) {
      print(e);
    }
    return '';
  }
}
