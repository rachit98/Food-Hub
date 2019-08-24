import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Reserve Table'),
        ),
        body: new Container(
          child: new Center(
              child: RaisedButton(
            color: Colors.lightBlue[100],
            child: Text('BACK'),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
        ));
  }
}
