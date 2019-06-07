import 'package:flutter_web/material.dart';
import 'SearchScreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      home: new SearchScreen(),
    );
  }
}