import 'package:flutter/material.dart';
import './first.dart' as first;
import 'package:firebase_auth/firebase_auth.dart';
import './signup.dart' as sign;

FirebaseAuth _auth = FirebaseAuth.instance;
class AuthPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
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

  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10,200,10,10),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'USERNAME'),
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
                  password = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(150, 4, 150, 0),
              child: RaisedButton(
                color: Colors.pink[50],
                child: Text('LOGIN'),
                onPressed: () => signIn(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(150, 4, 150, 0),
              child: RaisedButton(
                color: Colors.pink[50],
                child: Text('SIGN UP'),
                onPressed: () => moveToSignup(),
                              ),
                            )  
                          ],
                        ),
                      ),
                    );
                  }
                
                  
                    signIn() {
                      try{
                    _auth.signInWithEmailAndPassword(email:username,password:password).then((newUser){
                      Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    first.FirstPage()));
                                                    
                    });}
                    catch(error){
                      wrongpass(context);
                    }
                  }
                  
                
                  moveToSignup() {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>
                      sign.SignUpPage()));
                  }
}
