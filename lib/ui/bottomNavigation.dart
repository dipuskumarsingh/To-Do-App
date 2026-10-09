

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_ws/ui/accountScreen.dart';
import 'package:todo_app_ws/ui/chartScreen.dart';
import 'package:todo_app_ws/ui/homeScreen.dart';
import 'package:todo_app_ws/ui/notificationScreen.dart';

class bottomNavigation extends StatefulWidget{
  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int selectIndex = 0;

  List<Widget> pageNavigation = [
    homeScreen(),
    chartScreen(),
    notificationScreen(),
    accountScreen(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: pageNavigation [selectIndex],
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(Icons.home, color: Colors.black,),
                icon: Icon(Icons.home_outlined), label: ""),
            NavigationDestination(
              selectedIcon: Icon(Icons.bar_chart, color: Colors.black,),
                icon: Icon(Icons.bar_chart_outlined), label: ""),
            NavigationDestination(
              selectedIcon: Icon(Icons.notifications, color: Colors.black,),
                icon: Icon(Icons.notifications_outlined), label: ""),
            NavigationDestination(
              selectedIcon: Icon(Icons.account_circle, color: Colors.black,),
                icon: Icon(Icons.account_circle_outlined), label: ""),
          ],
        backgroundColor: Colors.white,
        indicatorColor: Colors.white,
        selectedIndex: selectIndex,
          onDestinationSelected: (value){
            selectIndex = value;
            setState(() {

            });
          },
      )
    );
  }
}