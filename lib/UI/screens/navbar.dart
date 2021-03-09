import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/AddFoodPage/add_food_page.dart';
import 'package:ifridgev2/UI/screens/homescreen.dart';
import 'package:ifridgev2/UI/screens/profile.dart';
import 'package:ifridgev2/UI/screens/recipes.dart';

class NavBar extends StatefulWidget {
  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int currIndex = 0;
  final tabs = [
    HomeScreen(),
    Center(child: Text('Cart')),
    Center(child: Text('Add')),
    Recipes(),
    AddFoodPage(),
    Center(child: Text('Recipes')),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF1c2754),
        selectedItemColor: Color(0xFF3658d8),
        unselectedItemColor: Color(0xFF7d839e),
        iconSize: 30,
        selectedFontSize: 11,
        unselectedFontSize: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            currIndex = index;
          });
        },
      ),
    );
  }
}
