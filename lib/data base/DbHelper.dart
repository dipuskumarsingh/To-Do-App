


import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_ws/data%20base/model.dart';

class dataBaseH{
  dataBaseH._();
  static dataBaseH initialiseDB()=>dataBaseH._();

  /// this is only table name
   static const String USER_TABLE_NAME = "userTable";
   static const String NOTE_TABLE_NAME = "noteTable";
   /// this is only user column name
   static const String USER_COLUMN_ID = "userId";
   static const String USER_COLUMN_FULL_NAME = "userFullName";
   static const String USER_COLUMN_EMAIL = "userEmail";
   static const String USER_COLUMN_PASSWORD = "userPassword";
   /// this is only user column name
   static const String NOTE_COLUMN_ID = "noteId";
   static const String USER_NOTE_COLUMN_ID = "userId";
   static const String NOTE_COLUMN_TITLE = "noteTitle";
   static const String NOTE_COLUMN_SUB_TITLE = "noteSubTitle";
   static const String NOTE_COLUMN_INITIAL_TIME= "initialTime";
   static const String NOTE_COLUMN_LAST_TIME = "lastTime";
   static const String NOTE_COLUMN_ON_CREATED_AT = "noteCreatedAt";

   Database? mDataDB;
  /// first open DB and get DB
  Future<Database>getDB()async{
    if(mDataDB != null){
      return mDataDB!;
    } else{
      mDataDB = await openDB();
      return mDataDB!;
    }
  }

  Future<Database> openDB()async{
    var appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "mainDB.db");
    return  await openDatabase(dbPath, version: 1, onCreate: (db, version){
      db.execute("create table $USER_TABLE_NAME ( $USER_COLUMN_ID integer primary key autoincrement, $USER_COLUMN_FULL_NAME text, $USER_COLUMN_EMAIL text, $USER_COLUMN_PASSWORD text)");
      db.execute("create table noteTable ( noteId integer primary key autoincrement, userId integer, noteTitle text, noteSubTitle text, initialTime text, lastTime text, noteCreatedAt text )");
    });
  }

  /// quire
/// add user data
Future<bool>addNoteData({required noteDataModel newNoteModel})async{
    var db = await getDB();
    int rowsEffected = await db.insert(NOTE_TABLE_NAME, newNoteModel.toMap());
    return rowsEffected > 0;
}

/// fetch all notes data
Future<List<noteDataModel>> fetchAllNotesData()async{
    var db = await getDB();
    List<Map<String, dynamic>> mNotesData = await db.query(NOTE_TABLE_NAME,orderBy: "$NOTE_COLUMN_ON_CREATED_AT DESC");
    List<noteDataModel> mNotes = [];
    for(int i = 0; i<mNotesData.length; i++){
      noteDataModel eachNotes = noteDataModel.fromMap(mNotesData[i]);
      mNotes.add(eachNotes);
    }
    return mNotes;
}

/// USER related quire
/// user register
Future<bool> userRegister({required userDataModel user})async{
   var db = await getDB();
   int rowsEffected = await db.insert(USER_TABLE_NAME, user.toMap());
   return rowsEffected > 0;
}

/// is user all ready register this code is used for check
Future<bool>isUserAllReadyRegister({required String email})async{
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(USER_TABLE_NAME, where:"$USER_COLUMN_EMAIL = ?", whereArgs: [email]);
    return mData.isNotEmpty;
}

/// authenticate user
Future<bool> authenticateUser({required String email, required String password})async{
    var db = await getDB();
    List<Map<String , dynamic >> mData = await db.query(USER_TABLE_NAME,where: "$USER_COLUMN_EMAIL = ? AND $USER_COLUMN_PASSWORD = ?", whereArgs: [email,password]);

    /// to manage session of shared prefs
    if(mData.isNotEmpty) {
      var prefs = await SharedPreferences.getInstance();
      prefs.setInt("user_id", mData[0][USER_COLUMN_ID]);
    }
    return mData.isNotEmpty;
}
}