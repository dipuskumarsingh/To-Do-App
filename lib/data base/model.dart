

import 'package:todo_app_ws/data%20base/DbHelper.dart';

class userDataModel{
  int id;
  String fullName;
  String email;
  String password;

  userDataModel({this.id = 0,  required this.fullName, required this.email, required this.password});

  /// from map
factory userDataModel.fromMap(Map<String, dynamic> map){
  return userDataModel(
    id: map[dataBaseH.USER_COLUMN_ID],
      fullName: map[dataBaseH.USER_COLUMN_FULL_NAME],
      email: map[dataBaseH.USER_COLUMN_EMAIL],
      password: map[dataBaseH.USER_COLUMN_PASSWORD]
  );
}

/// to map
Map<String, dynamic> toMap(){
  return{
    dataBaseH.USER_COLUMN_FULL_NAME: fullName,
    dataBaseH.USER_COLUMN_EMAIL: email,
    dataBaseH.USER_COLUMN_PASSWORD: password,
  };
  }
}

/// this model is for note data
class noteDataModel{
int id;
int? uId;
String title;
String subTitle;
String initialTime;
String lastTime;
String createdAt;
noteDataModel({this.id = 0, this.uId, required this.title, required this.subTitle, required this.initialTime, required this.lastTime, required this.createdAt,});
/// from map
factory noteDataModel.fromMap(Map<String, dynamic> map){
  return noteDataModel(
    id:map[dataBaseH.NOTE_COLUMN_ID],
      uId: map[dataBaseH.USER_NOTE_COLUMN_ID],
      title: map[dataBaseH.NOTE_COLUMN_TITLE],
      subTitle: map[dataBaseH.NOTE_COLUMN_SUB_TITLE],
      initialTime: map[dataBaseH.NOTE_COLUMN_INITIAL_TIME],
      lastTime: map[dataBaseH.NOTE_COLUMN_LAST_TIME],
      createdAt: map[dataBaseH.NOTE_COLUMN_ON_CREATED_AT]
  );
}

/// to map
Map<String,dynamic>toMap(){
  return{
    dataBaseH.USER_NOTE_COLUMN_ID: uId,
    dataBaseH.NOTE_COLUMN_TITLE: title,
    dataBaseH.NOTE_COLUMN_SUB_TITLE: subTitle,
    dataBaseH.NOTE_COLUMN_INITIAL_TIME: initialTime,
    dataBaseH.NOTE_COLUMN_LAST_TIME: lastTime,
    dataBaseH.NOTE_COLUMN_ON_CREATED_AT: createdAt,
  };
}
}
