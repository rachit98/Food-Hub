import 'package:flutter/material.dart';
import './auth.dart' as auth;

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Center(
          child: RaisedButton(
        child: Text('SIGN OUT'),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => auth.AuthPage()));
        },
      )),
    );
  }
}
