import 'package:flutter/material.dart';
import 'package:ifridgev2/UI/screens/profile.dart';

class LoggedInWidgetTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1f213f),
        body: SingleChildScrollView(
          child: Container(
            // Background for the home page
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              // Padding for the main page
              padding: EdgeInsets.only(left: 10, top: 30, right: 10),
              // Column represents entire page as column
              child: Column(
                children: [
                  // Top row with welcome and picture of logged in user
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Welcome, ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tony',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            Profile();
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundImage:
                                  AssetImage('assets/images/0.jpg'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Expiring Soon Container
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 15),
                    child: Container(
                      width: width,
                      height: 220.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF233168),
                            borderRadius: BorderRadius.circular(20)),
                        // Column of data inside the container
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 30, right: 30, top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Expiring Soon',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed('/test');
                                    },
                                    child: Text(
                                      'All Items >',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 100,
                              height: 120,
                              // color: Colors.transparent,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                    Color(0xFF344899),
                                    Color(0xFF233168)
                                  ])),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Recipes Container
                  Padding(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 20),
                    child: Container(
                      width: width,
                      height: 350.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF233168),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 30, right: 30, top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Recipes To Use',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Text(
                                    'All Recipes >',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
