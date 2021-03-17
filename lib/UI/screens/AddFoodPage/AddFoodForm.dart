import 'package:flutter/material.dart';
import 'package:ifridgev2/entities/food_entity.dart';
import './AddFoodWidgets.dart';

class AddFoodForm extends StatefulWidget {
  @override
  _AddFoodFormState createState() => _AddFoodFormState();
}

class _AddFoodFormState extends State<AddFoodForm> {
  final _formKey = GlobalKey<FormState>();
  List<FoodRow> FoodList = [FoodRow()];
  int FormLength = 0;
  List<Widget> DeleteList = [DeleteRow(0)];

  addFoodRow() {
    setState(() {
      FormLength++;
      FoodList.add(FoodRow());
      DeleteList.add(DeleteRow(FormLength));
      print(DeleteList);
    });
  }

  deleteFoodRow(int index) {
    DeleteList.removeAt(index);
  }

  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Expanded(
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Form(
                      key: _formKey,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: FoodList.length,
                        itemBuilder: (_, index) => FoodList[index],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: DeleteList.length,
                itemBuilder: (_, index) => DeleteList[index],
              )),
            ]),
          ),
        ]),
      ),
      ButtonBar(mainAxisSize: MainAxisSize.min, children: [
        RaisedButton(onPressed: addFoodRow, child: new Text('Add Item'))
      ])
    ]);
  }
}

class DeleteRow extends StatelessWidget {
  DeleteRow(this.index);
  final int index;
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.delete),
        onPressed: _AddFoodFormState().deleteFoodRow(index));
  }
}
