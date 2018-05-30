import 'package:flutter/material.dart';
import 'package:flutter_basic_dog/components/DogCard.dart';
import 'package:flutter_basic_dog/model/dog.dart';

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

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{

  var initalDogs = []
    ..add(new Dog('Husky', 'Scotland', 'nice dog breeds'));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black38,
      ),
      body: new Container(
        child: new DogCard(initalDogs[0]),
      ),
    );
  }

}
