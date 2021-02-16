import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/screens/login.dart';
import 'package:ifridgev2/UI/screens/navbar.dart';
import 'package:ifridgev2/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ifridgev2/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
        debugShowCheckedModeBanner: false,
        home: NavBar(),
        routes: {
          //'loginScreen': (content) => LoginScreen(),
        });
=======
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
>>>>>>> 7049335abb52070973e7b6917095ccb963522c30
  }
}
