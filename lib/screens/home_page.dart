import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_basic_dog/components/dog_list.dart';
import 'package:flutter_basic_dog/model/dog.dart';
import 'package:flutter_basic_dog/screens/new_dog_form.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Dog> initialDogs = []
    ..add(new Dog('Husky', 'Scotland', 'nice dog breeds'))
    ..add(new Dog('Rex', 'Dallas, TX, USA', 'nice dog breeds'))
    ..add(new Dog('Regum', 'Tex, TX, USA', 'nice dog breeds'))
    ..add(new Dog('Qeon', 'USA, TX, USA', 'nice dog breeds'))
    ..add(new Dog('Buddy', 'North Pole, Earth', 'nice dog breeds'));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.black38,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          )
        ],
      ),
      body: new Container(
        child: new Center(
          child: new DogList(initialDogs),
        ),
      ),
    );
  }

  Future<Null> _showNewDogForm() async {
    var newDog = await Navigator
        .of(context)
        .push(new MaterialPageRoute(builder: (context) {
      return new AddDogFormPage();
    }));

    if (newDog != null) {
      initialDogs.add(newDog);
    }
  }
}
