import 'package:flutter/material.dart';
import 'package:flutter_basic_dog/model/dog.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  State<StatefulWidget> createState() => new _DogCardState(dog);
  
}

class _DogCardState extends State<DogCard> {
  Dog dog;
  String renderUrl;
  String defaultImage =
      'https://images.dog.ceo/breeds/elkhound-norwegian/n02091467_4761.jpg';

  _DogCardState(this.dog);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120.0,
      child: new Stack(
        children: <Widget>[
          new Positioned(
            child: dogImage,
          )
        ],
      ),
    );
  }

  Widget get dogImage {
    var dogAvatar = new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(renderUrl ?? defaultImage))),
    );
    return dogAvatar;
  }

  @override
  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await dog.getImageUrl();
    setState(() {
      renderUrl = dog.imageUrl;
    });
  }
}
