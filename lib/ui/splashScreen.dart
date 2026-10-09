import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_ws/ui/bottomNavigation.dart';
import 'package:todo_app_ws/ui/onbording/login.dart';

class splashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: splash_screen());
  }
}

class splash_screen extends StatefulWidget {
  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async{  ////// skip the login page when user is allready login in app
      var prefs = await SharedPreferences.getInstance();
      int uid = prefs.getInt("user_id") ?? 0;
      Widget navigateTo = LoginScreen();
      if(uid > 0){
        navigateTo = bottomNavigation();
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navigateTo),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/to-do.png",width: 80,color: Colors.black,),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(child: Image.asset("assets/images/loadingIcon.png",width: 25,color: Colors.black,)),
                  Text( "Loading...",style: TextStyle(color: Color(0xff98999c)),),
                ],
              ))
        ],
      ),
    );
  }
}
