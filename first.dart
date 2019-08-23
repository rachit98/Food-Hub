import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './account.dart' as account;
import './favorite.dart' as favorite;
import './foodie.dart' as foodie;
import './history.dart' as history;

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => new _FirstPage();
}

class _FirstPage extends State<FirstPage> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FoodHub'),
        //backgroundColor: Colors.deepPurple,
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
            ),
            new Tab(
              icon: new Icon(Icons.favorite),
            ),
            new Tab(
              icon: new Icon(Icons.history),
            ),
            new Tab(
              icon: new Icon(Icons.lock),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new foodie.FoodiePage(),
          new favorite.FavoritePage(),
          new history.HistoryPage(),
          new account.AccountPage()
        ],
      ),
    );
  }
}
