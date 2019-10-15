import 'package:flutter/material.dart';
import './payment.dart' as payment;
import './menu.dart' as menu;
int x=0;
class DetailPage extends StatefulWidget{
  String title;
  DetailPage(this.title);
  State<StatefulWidget> createState() {
   
    return _DetailPage(title);
  }
}
class _DetailPage extends State<DetailPage> {
  final String title;

  _DetailPage(this.title);
  String people;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          title: Text(title),
        ),
        body: new Container(
            child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10,150,10,10),
              child: TextField(
                decoration: InputDecoration(labelText: 'NO OF PEOPLE'),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  setState(() {
                    people = value;
                    int x=int.parse(people);
                    x=x*25;
                    people=x.toString();
                  });
                },
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 4, 50, 0),
                  child: RaisedButton(
                    color: Colors.pink[50],
                    child: Text('Payment'),
                    onPressed: () {
                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          payment.PaymentPage(x.toString(),title,people)));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 4, 50, 0),
                  child: RaisedButton(
                    color: Colors.pink[50],
                    child: Text('Check Menu'),
                    onPressed: () {
                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          menu.MenuPage(people,title)));
                    },
                  ),
                ),
              ],
            )
          ],
        )));
  }
}
