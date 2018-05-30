import 'package:flutter/material.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddDogFormState();
}

class _AddDogFormState extends State<AddDogFormPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('add new dog'),
        backgroundColor: Colors.black38,
      ),
      body: new Container(
        child: new Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: 'name the puppy'),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: 'Puppy Loc'),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new TextField(
                  decoration: new InputDecoration(labelText: 'Puppy Desc'),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Builder(builder: (context) {
                  return new RaisedButton(
                    onPressed: () => print('button submit pressed'),
                    color: Colors.indigoAccent,
                    child: new Text('Submit'),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
