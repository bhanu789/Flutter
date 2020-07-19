import 'package:flutter/material.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/util/dbhelper.dart';
import 'package:intl/intl.dart';

DbHelper dbhelper =DbHelper();
final List <String> choices = const <String>[
  'Save Todo & Go Back',
  'Delete Todo',
  'Back to List'
];

const String mnuSave='Save Todo & Go Back';
const String mnuDelete='Delete Todo';
const String mnuBack='Back to List';

class ToDoDetail extends StatefulWidget{
  final ToDo todo ;
  ToDoDetail(this.todo);

  @override
  State<StatefulWidget> createState() => ToDoDetailState(todo);
   
}

class ToDoDetailState extends State{
  ToDo todo;
  final _priorities = ["High","Medium","Low"];
  String _priority="Low";
  
  ToDoDetailState(this.todo); //constructor

  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    titleController.text=todo.title;
    descriptionController.text=todo.description;
    TextStyle textStyle=Theme.of(context).textTheme.title;
    
    return Scaffold(  
      appBar: AppBar(title: Text('TOFO'),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: select,
          itemBuilder: (BuildContext context){
            return choices.map((String choice ){
              return PopupMenuItem<String>(
                  value:choice,
                  child:Text(choice),
            );
            }
            ).toList();
            },
        )
      ],
    ),
    body: Padding(padding: EdgeInsets.only(top:35,left:10,right: 10),
    child: ListView(children: <Widget>[
    Column(children: <Widget>[
        TextField(
          controller: titleController,
          style: textStyle,
          onChanged: (value)=> this.updateTitle(),
          decoration: InputDecoration(
            labelText: "Title",
            labelStyle: textStyle,
            border: OutlineInputBorder(borderRadius:BorderRadius.circular(5.0))),

        ),
        Padding(padding: EdgeInsets.only(top:15.0,bottom: 15.0),
        child:     
        TextField(
          controller: descriptionController,
          style: textStyle,
          onChanged: (value)=> this.updateDescription(),
          decoration: InputDecoration(
            labelText: "Description",
            labelStyle: textStyle,
            border: OutlineInputBorder(borderRadius:BorderRadius.circular(5.0))),
        ),     
        ),
       ListTile( title:  DropdownButton<String>(
        hint: Text('Priotity'),
        items: _priorities.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        })
        .toList(), 
        style: textStyle,
        value:retrivePriority(todo.priority),
        onChanged: (value)=>updatePriority(value),
      ),
    ),
    ],)
    ],)
    ,) 
   )
    ;
  }
  
  void select(String value) async{
    int result;
    switch (value){
      case mnuSave: 
        save();
        break;
      case mnuDelete:
        Navigator.pop(context, true);
        if (todo.id==null){
          return;
        }  
        result=await dbhelper.deleteToDos(todo.id);
        if (result!=0)
        {
          AlertDialog alertDialog=AlertDialog(
            title: Text("Delete TODO"),
            content: Text("The Todo has delete "),
          );
          showDialog(context: context,
          builder: (_) => alertDialog);
        }
        break;
    case  mnuBack:
      Navigator.pop(context,true);
      break;
    
    }
  }
    void save(){
      todo.date=new DateFormat.yMd().format(DateTime.now());
      if (todo.id!=null){
        dbhelper.updateToDos(todo);

      }
      else{
        dbhelper.insertToDo(todo);
      }
    Navigator.pop(context,true);
    }
    
    void updatePriority(String value){
      switch (value){
        case 'High':
          todo.priority=1;
          break;
        case 'Medium':
          todo.priority=2;
          break;
        case 'Low':
          todo.priority=3;
          break;
      }

      setState(() {
        _priority=value;
      });


    }

    String retrivePriority(int value){
        return _priorities[value-1];
  }

    void updateTitle(){
      todo.title=titleController.text;
    }
    void updateDescription(){
      todo.description=descriptionController.text;
    }
 }

