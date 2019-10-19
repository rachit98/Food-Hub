import 'package:flutter/material.dart';
import './menuinfo.dart';
import './restaurant.dart';
import './detail.dart' as detail;
class FavoritePage extends StatefulWidget
{
   State<StatefulWidget> createState() {
    return _FavoritePage();
  }
}

class _FavoritePage extends State<FavoritePage> {
final List<Restaurant> RestaurantList = [
    Restaurant("Navjivan", "Veg.", 200, 3.75),
    Restaurant("Cafe Musica", "Cafe.", 150, 4.2),
    Restaurant("Aquenos", "Veg.", 300, 3.5),
    Restaurant("Boulevard9", "Veg. and Non Veg.", 700, 4.5),
    Restaurant("Swad", "Veg.", 250, 4.0),
    Restaurant("Affame", "Cafe", 300, 3.0),
  ];

  String resnames='';
  @override
  Widget build(BuildContext context) {
    return new Container(
     child: IconButton(icon: Icon(Icons.search), onPressed: (){
       showSearch(context: context,delegate: DataSearch());
     },),
    );
  }
}
class DataSearch extends SearchDelegate<String>
{
  final ress=[
    "Navjivan",
    "Cafe Musica",
    "Aquenos",
    "Boulevard9",
    "Swad",
    "Affame"
  ];

  final recents=[
    "Aquenos",
    "Swad"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
     IconButton(icon: Icon(Icons.clear), onPressed: (){
      query="";
     }
     )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),onPressed: (){
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggesstionList= query.isEmpty?recents:ress.where((p)=>p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) =>ListTile(
        onTap: (){
          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    detail.DetailPage(suggesstionList[index].toString())));
        },
        leading: Icon(Icons.restaurant),
        title: RichText(text: TextSpan(
          text: suggesstionList[index].substring(0,query.length),
          style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold
          ),
          children: [TextSpan(
            text: suggesstionList[index].substring(query.length),
          )]
        ),),
      ),
      itemCount: suggesstionList.length,
    );
  }
  
}