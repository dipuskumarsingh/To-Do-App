

import 'package:todo_app_ws/data%20base/model.dart';

class eventClass {}
class addNoteEvent extends eventClass{
  noteDataModel newNoteModel;
  addNoteEvent({required this.newNoteModel});
}

class fetchInitialEvent extends eventClass{}
class fetchFilterNoteEvent extends eventClass{
  int flag;
  fetchFilterNoteEvent({required this.flag});
}
