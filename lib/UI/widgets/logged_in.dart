import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ifridgev2/repository/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            children: [
              // Top row with welcome and picture of logged in user
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Feb 10, 2021',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Welcome ' + user.displayName + '!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Email: ' + user.email,
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(user.photoURL.toString()),
                    ),
                  )
                ],
              ),
              // Logout button temporarily here
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                child: Text('Logout'),
              )
            ],
          )),
    );

    // return Container(
    //     alignment: Alignment.center,
    //     child: Column(
    //       children: [
    //         Text('Logged In'),
    //         SizedBox(
    //           height: 8,
    //         ),
    //         Text(
    //           'Name' + user.displayName,
    //         ),
    //         SizedBox(
    //           height: 8,
    //         ),
    //         Text(
    //           'Email: ' + user.email,
    //         ),
    //         CircleAvatar(
    //           radius: 55,
    //           backgroundColor: Colors.white,
    //           child: CircleAvatar(
    //             radius: 50,
    //             backgroundImage: NetworkImage(user.photoURL.toString()),
    //           ),
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             final provider =
    //                 Provider.of<GoogleSignInProvider>(context, listen: false);
    //             provider.logout();
    //           },
    //           child: Text('Logout'),
    //         )
    //       ],
    //     ));
  }
}
