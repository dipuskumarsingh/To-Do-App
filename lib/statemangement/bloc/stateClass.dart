

import 'package:todo_app_ws/data%20base/model.dart';

class stateClass {}
class initialStateClass extends stateClass{}
class loadingStateClass extends stateClass{}
class loadedStateClass extends stateClass{
  List<noteDataModel> mNoteModel;
  loadedStateClass({required this.mNoteModel});
}

class errorStateClass extends stateClass{
  String errorMsg;
  errorStateClass({required this.errorMsg});
}