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
    return new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: new Container(
          height: 115.0,
          child: new Stack(
            children: <Widget>[
              dogCard,
              new Positioned(top: 7.5, child: dogImage)
            ],
          ),
        ));
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

  Widget get dogCard {
    return new Container(
      width: 290.0,
      height: 115.0,
      child: new Card(
        color: Colors.black12,
        margin: const EdgeInsets.only(left: 42.0),
        child: new Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Text(widget.dog.name,
                  style: Theme.of(context).textTheme.headline),
              new Text(widget.dog.loc),
              new Row(
                children: <Widget>[
                  new Icon(Icons.star),
                  new Text(': ${widget.dog.rating}')
                ],
              )
            ],
          ),
        ),
      ),
    );
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
