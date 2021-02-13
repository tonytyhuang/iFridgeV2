import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/widgets/sign_up_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => buildSignUp();

  Widget buildSignUp() => Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 80,
                  child: Text(
                    'iFridge',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 450,
              ),
              GoogleSignupButton(),
            ],
          ),
        ),
      );
}
