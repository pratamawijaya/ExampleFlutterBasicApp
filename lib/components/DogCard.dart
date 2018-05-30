import 'package:flutter/material.dart';
import 'package:flutter_basic_dog/model/dog.dart';


class DogCard extends StatefulWidget {

  final Dog dog;
  
  DogCard(this.dog);

  @override
  State<StatefulWidget> createState() => new _DogCardState(dog);

}

class _DogCardState extends State<DogCard>{
  Dog dog;

  _DogCardState(this.dog);

  @override
  Widget build(BuildContext context) {
    return new Text(widget.dog.name);
  }
}