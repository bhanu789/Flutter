import "package:flutter/material.dart";
import "package:to_do_list/screens/todolist.dart";

void main()=> runApp( Myapp());

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(title: "Todos",
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
    ),
    home: MyHomePage(title:"Todos")
    );
  }

}
class MyHomePage extends StatefulWidget{
  MyHomePage({Key key,this.title}):super(key:key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage>{
  
  @override
  Widget build(BuildContext context) {
       
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),
      ),
      body: TodoList(),
    );
  }
}

