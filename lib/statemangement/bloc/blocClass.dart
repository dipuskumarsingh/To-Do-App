
import 'package:bloc/bloc.dart';
import 'package:todo_app_ws/data%20base/DbHelper.dart';
import 'package:todo_app_ws/data%20base/model.dart';
import 'package:todo_app_ws/statemangement/bloc/eventclass.dart';
import 'package:todo_app_ws/statemangement/bloc/stateClass.dart';

class noteBlocClass extends Bloc<eventClass, stateClass>{
  dataBaseH newDB;
  noteBlocClass({required this.newDB}) :super(initialStateClass()){
    on<addNoteEvent>((event, emit)async{
      emit(loadingStateClass());
     bool check = await  newDB.addNoteData(newNoteModel: event.newNoteModel);
     if(check){
       List<noteDataModel> allNotes = await newDB.fetchAllNotesData();
       emit(loadedStateClass(mNoteModel: allNotes));
     }else{
       emit(errorStateClass(errorMsg: "notes not add"));
     }
    });

    on<fetchInitialEvent>((event, emit)async{
      emit(loadingStateClass());
    List<noteDataModel> allNotes = await   newDB.fetchAllNotesData();
    emit(loadedStateClass(mNoteModel: allNotes));
    });
  }
}