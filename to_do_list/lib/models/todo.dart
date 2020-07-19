import 'package:flutter/cupertino.dart';

class ToDo{
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  ToDo(this._title,this._priority,this._date,[this._description]);
  ToDo.withId(this._id,this._title,this._priority,this._date,[this._description]);
  
  int get id => _id;
  String get title =>_title;
  String get description =>_description;
  String get date =>_date;
  int get priority =>_priority;

  set title(String newTitle){
    if (newTitle.length<=255){
      _title=newTitle;

    }
  }

  set description(String newDescription){
    if (newDescription.length<=255){
      _description=newDescription;

    }
  }
  set priority(int newPriority){
    if (newPriority<=3 && newPriority>0){
      _priority=newPriority;
    }
  }

  set date(String newDate){
      _date=newDate;
  }

  Map <String,dynamic> toMap(){
    var map= Map <String,dynamic>();
    map['title']=_title;
    map['description']=_description;
    map['priority']=_priority;
    map['date']=_date;
    if (map['id']!=null){
      map['id']=_id;
    }
    return map;

  }

  // Takes any object and transform it into ToDo
  ToDo.fromObject(dynamic o){
    this._id=o["id"];
    this._priority=o["priority"];
    this._description=o["description"];
    this._title=o["title"];
    this._date=o["date"];

  }
}

