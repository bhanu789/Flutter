import "package:flutter/material.dart";

void main() => runApp(MyMiCard());

class MyMiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/my_pic.jpg'),
              ),
              Text(
                "Bhanu Yadav",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Text(
                "FLUTTER AND PYTHON DEVELOPER",
                style: TextStyle(
                  color: Colors.teal.shade100,
                  fontFamily: "PlayfairDisplay-Italic",
                  fontSize: 15,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 300,
                height: 10,
                child:Divider(color:Colors.teal.shade100)
              ),
              Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.call,
                      color: Colors.teal.shade900,
                    ),
                    title: Text(
                      '+91-9022 490 188',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  )),
              Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.teal.shade900,
                    ),
                    title: Text(
                      'bhanukumar.yadav@gmail.com',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.teal.shade900,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
