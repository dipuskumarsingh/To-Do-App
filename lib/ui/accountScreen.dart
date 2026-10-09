

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_ws/ui/onbording/register.dart';

class accountScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>registerScreen()));
        }, child: Text("Register now",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}