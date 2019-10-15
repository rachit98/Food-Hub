import 'package:flutter/material.dart';
import './first.dart' as first;
import 'package:firebase_auth/firebase_auth.dart';
import './auth.dart' as auth;

FirebaseAuth _auth = FirebaseAuth.instance;
class SignUpPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}


class _AuthPage extends State<SignUpPage> {
  final myController = TextEditingController();
  void wrongpass(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Error!!!'),
      content: Text('Invalid username or password'),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  String username = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text('SIGNUP'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10,200,10,10),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'EMAIL'),
              onChanged: (String value) {
                setState(() {
                  username = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'PASSWORD'),
              obscureText: true,
              onChanged: (String value) {
                //obscureText: true;
                setState(() {
                  _password = value;
                });
              },
            ),
            Text('Your password must be of atleast 8 characters and must contain an alphabet, a digit and a special character'),
            Padding(
              padding: const EdgeInsets.fromLTRB(150, 4, 150, 0),
              child: RaisedButton(
                color: Colors.pink[50],
                child: Text('CREATE'),
                onPressed: () => _signUp(),
              ),
            )
          ],
        ),
      ),
    );
  }

 void _signUp() async {
   try
   {
      await _auth.createUserWithEmailAndPassword(email: username,password: _password);
      
            Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => auth.AuthPage()));
                        accountsuccess(context);
         }catch(error)
         {
      wrongpass(context);
         }
        }
      
        void accountsuccess(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Congrats!!!'),
      content: Text('Account created successfully'),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}