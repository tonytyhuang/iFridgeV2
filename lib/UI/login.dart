import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ifridgev2/UI/navbar.dart';
import 'package:ifridgev2/UI/widgets/logged_in.dart';
import 'package:ifridgev2/UI/widgets/sign_up_widget.dart';
import 'package:ifridgev2/repository/google_sign_in.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
            child: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  final provider = Provider.of<GoogleSignInProvider>(context);
                  if (provider.isSigningIn) {
                    return buildLoading();
                  } else if (snapshot.hasData) {
                    return LoggedInWidget();
                  } else {
                    return SignUpWidget();
                  }
                })));
  }

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}
