import 'package:flutter/material.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/util/dbhelper.dart';
import 'package:to_do_list/screens/tododetails.dart';

class TodoList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TodoListState();

}

class TodoListState extends State{
  DbHelper helper= DbHelper(); //db connection
  List<ToDo> todos; 
  int count=0;
  

  @override
  Widget build(BuildContext context) {
    if (todos==null){
      todos=List<ToDo>();
      getData();
    }
    return Scaffold (
    body:todoListItems(),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        navigatetoDetail(ToDo('',3,''));
      },
      tooltip: "Add New ToDo",
      child: Icon(Icons.add),
    ),);
  }

  ListView todoListItems()
  {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context,int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child:ListTile(
            leading: CircleAvatar(
              backgroundColor: getCOlor(this.todos[position].priority),
              child: Text(this.todos[position].id.toString()),
            ), 
            title: Text(this.todos[position].title),           
            subtitle: Text(this.todos[position].date),
            onTap: (){
              debugPrint("Tappded on" + this.todos[position].id.toString());
              navigatetoDetail(this.todos[position]);
            },

          )
        );
      },

    );

  }
  
  void getData(){
    final dbfutur=helper.initializeDb();
    dbfutur.then(
      (result){
        final todosfuture= helper.getToDos();
        todosfuture.then(
          (result){
            List<ToDo> todoList=List<ToDo>();
            count=result.length;
            for(int i =0;i<count;i++){
              todoList.add(ToDo.fromObject(result[i]));
              debugPrint(todoList[i].title);
            }
            setState(() {
              todos=todoList;
              count=count;
            });
            debugPrint("Items "+count.toString());
          }) ;

      });

  }

  Color getCOlor(int priority){
    switch(priority){
      case 1: 
      return Colors.red;
      break;
      case 2:
      return Colors.orange;
      break;
      case 3:
      return Colors.green;
      break;
      default:
      return Colors.green;
}
  }

  void navigatetoDetail(ToDo todo) async{
    bool result=await Navigator.push(context, MaterialPageRoute(builder: (context)=> ToDoDetail(todo)));
    if (result==true){
      getData();
    }

  }
}