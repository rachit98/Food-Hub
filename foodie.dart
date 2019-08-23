import 'package:flutter/material.dart';
import './restaurant.dart';

class FoodiePage extends StatelessWidget {
  final List<Restaurant> RestaurantList = [
    Restaurant("Navjivan", "Veg.", 200, 3.75),
    Restaurant("Cafe Musica", "Cafe.", 150, 4.2),
    Restaurant("Aquenos", "Veg.", 300, 3.5),
    Restaurant("Boulevard9", "Veg. and Non Veg.", 700, 4.5),
    Restaurant("Swad", "Veg.", 250, 4.0),
    Restaurant("Affame", "Cafe", 300, 3.0),
  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
          itemCount: RestaurantList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildRestaurantCard(context, index)),
    );
  }

  Widget buildRestaurantCard(BuildContext context, int index) {
    final Res = RestaurantList[index];
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
                      Res.approxcost.toString() + "  per person.",
                      style: new TextStyle(fontSize: 15.0),
                    ),
                    Spacer(),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                  child: Row(children: <Widget>[
                    Spacer(),
                    Text(
                      Res.rating.toString(),
                      style: new TextStyle(fontSize: 15.0),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
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
