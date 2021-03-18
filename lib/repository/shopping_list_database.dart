import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifridgev2/entities/shopping_list_entity.dart';

abstract class IShoppingListDatabase {
  Future<String> addItem({ShoppingListItem shoppingItem});
  Future<List<ShoppingListItem>> getShoppingList();
}

class ShoppingListDatabaseService implements IShoppingListDatabase {
  final CollectionReference shoppingListCollection =
      FirebaseFirestore.instance.collection('shopping');

  @override
  Future<List<ShoppingListItem>> getShoppingList() async {
    String fakeId = "Jackiedoodoo";
    List<ShoppingListItem> shoppingList = [];
    try {
      QuerySnapshot querySnapshot = await shoppingListCollection
          .where("user_id", isEqualTo: fakeId)
          .get();
      if (querySnapshot.docs.length > 0) {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          Map<String, dynamic> json = doc.data();
          final ShoppingListItem food = ShoppingListItem(
              name: json['name'],
              quantity: json['quantity'],
              category: json['category']);
          shoppingList.add(food);
        }
      } else {
        return shoppingList;
      }
      return shoppingList;
    } catch (e) {
      print(e);
    }
    return shoppingList;
  }

  @override
  Future<String> addItem({ShoppingListItem shoppingItem}) async {
    String fakeId = "Jackiedoodoo";
    try {
      DocumentReference documentReference = await shoppingListCollection.add({
        "user_id": fakeId,
        "name": shoppingItem.name,
        "quantity": shoppingItem.quantity,
        "category": shoppingItem.category,
      });
      return documentReference.id;
    } catch (e) {
      print(e);
    }
    return '';
  }
}
