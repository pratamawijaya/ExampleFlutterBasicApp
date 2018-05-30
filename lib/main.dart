import 'package:flutter/material.dart';
import 'package:flutter_basic_dog/screens/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Rate dog',
      theme: new ThemeData(brightness: Brightness.light),
      home: new HomePage(title: 'Dog Rater'),
    );
  }
}