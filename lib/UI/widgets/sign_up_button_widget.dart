import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ifridgev2/repository/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4),
        child: OutlineButton.icon(
          label: Text(
            ' Sign in with Google',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          highlightedBorderColor: Colors.black,
          textColor: Colors.black,
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
        ));
  }
}
