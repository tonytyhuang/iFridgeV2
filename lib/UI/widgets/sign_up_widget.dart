import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/widgets/sign_up_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => buildSignUp();

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                'iFridge',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          Spacer(),
          GoogleSignupButton(),
        ],
      );
}
