import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ifridgev2/repository/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('Logged IN'),
            SizedBox(
              height: 8,
            ),
            Text(
              'Name' + user.displayName,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Email: ' + user.email,
            ),
            ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text('Logout'),
            )
          ],
        ));
  }
}
