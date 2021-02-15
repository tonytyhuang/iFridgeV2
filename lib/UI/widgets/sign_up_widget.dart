import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/widgets/sign_up_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f213f),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 220,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0),
                child: Text(
                  'iFridge',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                      fontSize: 50,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GoogleSignupButton(),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/test');
                },
                child: Text('test'))
          ],
        ),
      ),
    );
  }
}
