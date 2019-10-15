import 'package:flutter/material.dart';
import 'pages/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodHub',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.purple,
          accentColor: Colors.purple[50]),
      home: AuthPage(),
    );
  }
}
