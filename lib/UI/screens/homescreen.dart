import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/widgets/logged_in.dart';
import 'package:ifridgev2/UI/widgets/logged_in_temp.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f213f),
      body: LoggedInWidgetTemp(), 
    );
  }
}
