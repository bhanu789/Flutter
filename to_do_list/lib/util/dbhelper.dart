import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';  //to access db file directory
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list/models/todo.dart';

class  DbHelper{
  static final DbHelper _dbHelper=DbHelper._internal(); //called named constructor

  String tblTodo='todo';
  String colId="id";
  String colTitle="title";
  String colDescription="description";
  String colDate="date";
  String colPriority="priority";

  DbHelper._internal(); //name construnctor

  factory DbHelper()  //factory keyword return static constructor
  {
    return _dbHelper;
  }  

  static Database _db;
  
  Future<Database> get db async{
    if(_db == null){
      _db =await initializeDb();

    }
    return _db;
  } 
  
  // insert into Database

  //to open connection

  Future<Database> initializeDb() async {  //from async package
    Directory dir= await getApplicationDocumentsDirectory(); //path provider pacage
    String path=dir.path + "todos.db";
    var dbTodos = await openDatabase(path,version:1,onCreate: _createDB);
    return dbTodos;
  }
  
  void _createDB(Database db,int newVersion) async{
    await db.execute("Create table $tblTodo($colId INTEGER PRIMARY KEY,$colTitle TEXT,"+
    "$colDescription TEXT,$colPriority INTEGER,$colDate TEXT)");

  }
  
  Future<int> insertToDo(ToDo todo) async{
    Database db=await this.db;
    var result= await db.insert(tblTodo,todo.toMap());
    return result;
 }

 Future<List> getToDos() async{
   Database db= await this.db;
   var result= await db.rawQuery("select * from $tblTodo order by $colPriority ASC");
   return result;
}

 Future<int> getCounts() async{
   Database db= await this.db;
   var result=  Sqflite.firstIntValue(
     await db.rawQuery("select count(*) from $tblTodo")
   );
   return result;
}


 Future<int> updateToDos(ToDo todo) async{
   Database db= await this.db;
   var result= await db.update(tblTodo,todo.toMap(),where:"$colId =? ", whereArgs: [todo.id]);
   return result;
}

Future<int> deleteToDos(int id) async{
   Database db= await this.db;
   var result= await db.rawDelete("delete from $tblTodo where $colId =$id");
   return result;
}

}