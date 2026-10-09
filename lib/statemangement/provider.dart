

import 'package:flutter/foundation.dart';
import 'package:todo_app_ws/data%20base/DbHelper.dart';
import 'package:todo_app_ws/data%20base/model.dart';

class noteProvider extends ChangeNotifier{
  dataBaseH new_dataBase_h;
  noteProvider({required this.new_dataBase_h});
  List<noteDataModel> _mNotesDataPD = [];
  List<userDataModel> _mUserDataPd = [];

  /// get all data;
List<noteDataModel> getAllNotesDataPd(){
  return _mNotesDataPD;
}

/// all events
/// add notes
void addNotesPd({required noteDataModel newNoteModelPd})async{
  bool check = await new_dataBase_h.addNoteData(newNoteModel: newNoteModelPd);
  if(check){
    _mNotesDataPD = await new_dataBase_h.fetchAllNotesData();
    notifyListeners();
  }
}

/// fetch initial note data
void fetchInitialNoteDataPd()async{
  _mNotesDataPD = await new_dataBase_h.fetchAllNotesData();
  notifyListeners();
}


// void registerUserPd({required userDataModel newUserNoteModel})async{
// bool check = await  new_dataBase_h.userRegister(user: newUserNoteModel);
// if(check){
//   return _mUserDataPd = await new_dataBase_h.userRegister(user: user)
// }
// }
//
// void isUserAllreadyRegisterPd(){
//
// }
}