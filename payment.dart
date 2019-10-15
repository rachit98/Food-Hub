import 'package:flutter/material.dart';
import './foodie.dart' as foodie;
import './first.dart' as first;

class PaymentPage extends StatelessWidget {
  final String amount;
  final String title;
  final String amt;
  PaymentPage(this.amount, this.title, this.amt);
  void confirm(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Booking Confirmed'),
      content: Text('Check History Section for order details'),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('YOUR BILL')),
      body: new Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 50, 10),
              child: Text(
                title,
                style: new TextStyle(fontSize: 30.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 50, 10),
              child: Text(
                ' Booking Charges',
                style: new TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 150, 0),
              child: Text(
                amt,
                style: new TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 50, 10),
              child: Text(
                ' Food Charges',
                style: new TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 150, 0),
              child: Text(
                amount,
                style: new TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 50, 10),
              child: Text(
                ' Total charges',
                style: new TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 150, 0),
              child: Text(
                (int.parse(amt) + int.parse(amount)).toString(),
                style: new TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(100, 10,100,10),
              child: RaisedButton(
                  child: Text('Confirm'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                first.FirstPage()));
                    confirm(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
