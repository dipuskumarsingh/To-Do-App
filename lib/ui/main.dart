import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ws/data%20base/DbHelper.dart';
import 'package:todo_app_ws/statemangement/bloc/blocClass.dart';
import 'package:todo_app_ws/statemangement/provider.dart';
import 'package:todo_app_ws/ui/splashScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              noteBlocClass(newDB: dataBaseH.initialiseDB()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              noteProvider(new_dataBase_h: dataBaseH.initialiseDB()),
        ),
      ],
      child: splashScreen(),
    ),
  );
}
