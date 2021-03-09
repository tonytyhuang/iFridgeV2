import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifridgev2/UI/FoodList/widgets/FoodCard.dart';
import 'package:ifridgev2/bloc/food/food_bloc.dart';

class FoodListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodBloc, FoodState>(
      listener: (BuildContext context, FoodState state) {},
      builder: (BuildContext context, FoodState state) {
        if (state.foodList != null) {
          return Expanded(
              child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              color: Color(0xFF233168),
            ),
            child: Stack(children: [
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.foodList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        FoodCardWidget(state.foodList[index])),
              ),
            ]),
          ));
        } else if (state.error != null) {
          return Text(state.error);
        } else {
          return Text("Unknown Error");
        }
      },
    );
  }
}
