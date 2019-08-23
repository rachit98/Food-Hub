import 'package:flutter/material.dart';
import './first.dart';

class AuthPage extends StatefulWidget
{
State<StatefulWidget> createState(){
  return _AuthPage();
}
}
class _AuthPage extends State<AuthPage>
{
  void wrongpass(BuildContext context)
      {
        var alertDialog= AlertDialog(title: Text('Error!!!'),
        content: Text('Invalid username or password'),);
      

      showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
      );
      }
String username='';
  String password='';
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
      
      children: <Widget>[
    TextField(
      decoration: InputDecoration(labelText: 'USERNAME'),
      onChanged: (String value) {
      setState(() {
       username=value; 
      });
    },),
    TextField(
      decoration: InputDecoration(labelText: 'PASSWORD'),
      onChanged: (String value) {
      setState(() {
       password=value; 
      });
    },),
    
     RaisedButton(child: Text('LOGIN'),onPressed: (){
       if((username=='foodhub')&&(password=='admin'))
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>FirstPage()));
       else
       {wrongpass(context);}
       
     },)
    ],),),
      );
      
      
  }
}