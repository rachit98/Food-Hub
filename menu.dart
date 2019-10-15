import 'package:flutter/material.dart';
import './menuinfo.dart';
import './payment.dart' as payment;
int x=0,y=0;

class MenuPage extends StatelessWidget {
   List<MenuInfo> MenuInfoList = [
    MenuInfo("Chapati", "Bread", 15),
    MenuInfo("Subzi", "Main Course", 120),
    MenuInfo("Coffee", "Beverage", 50),
    MenuInfo("Munchurian", "Starters", 100),
    MenuInfo("Pulav", "Main Course", 180),

  ];
  final String size;
  final String title;
  MenuPage(this.size, this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(title + ' MENU'),
      ),
      body:new Container(
      child: new ListView.builder(
          itemCount: MenuInfoList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildMenuCard(context, index)),
    )
    );
  }
 void order(BuildContext context,String s) {
    var alertDialog = AlertDialog(
      title: Text('Added'),
      content: Text(s),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
  Widget buildMenuCard(BuildContext context, int index) {
    
    final Res = MenuInfoList[index];
    
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              // color: Colors.orange[50],
              elevation: 15.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(children: <Widget>[
                        Text(
                          Res.name,
                          style: new TextStyle(fontSize: 30.0),
                        ),
                        Spacer(),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(children: <Widget>[
                        Text(
                          Res.type,
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Spacer(),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(children: <Widget>[
                        Text(
                          Res.cost.toString() + "  per item",
                          style: new TextStyle(fontSize: 15.0),
                        ),
                        Spacer(),
                        
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(children: <Widget>[
                        
                    RaisedButton(
                      color: Colors.pink[50],
                      child: Text('Add'),
                      onPressed: () {
                        x=x+Res.cost;
                        order(context,Res.name);
                        
                      },
                    ),
                    Spacer(),
                    RaisedButton(
                      color: Colors.pink[50],
                      child: Text('Pay'),
                      onPressed: () {
                        y=x;
                        x=0;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    payment.PaymentPage(y.toString(),Res.name,size)));
                      },
                    ),
                    
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
