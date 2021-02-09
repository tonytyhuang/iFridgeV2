import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/homescreen.dart';

class NavBar extends StatefulWidget {
  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int currIndex = 0;
  final tabs = [
    Center(child: Text('Home')),
    Center(child: Text('Cart')),
    Center(child: Text('Add')),
    Center(child: Text('Recipes')),
    Center(child: Text('Profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF80adce),
        selectedItemColor: Color(0xFFeed5d1),
        unselectedItemColor: Colors.white,
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
