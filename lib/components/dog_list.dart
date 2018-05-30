import 'package:flutter/material.dart';
import 'package:flutter_basic_dog/components/dog_card.dart';
import 'package:flutter_basic_dog/model/dog.dart';

class DogList extends StatelessWidget {
  final List<Dog> dogs;

  DogList(this.dogs);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(BuildContext context) {
    return new ListView.builder(
        itemCount: dogs.length,
        itemBuilder: (context, int) {
          return new DogCard(dogs[int]);
        },
    );
  }
}
