import 'package:flutter/material.dart';
import 'package:flutter_basic_dog/model/dog.dart';

class DogDetailPage extends StatefulWidget {
  final Dog dog;

  DogDetailPage(this.dog);

  @override
  State<StatefulWidget> createState() => new _DogDetailPageState();
}

class _DogDetailPageState extends State<DogDetailPage> {
  double dogAvatarSize = 150.0;

  Widget get dogImage {
    return new Container(
      height: dogAvatarSize,
      width: dogAvatarSize,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            const BoxShadow(
                offset: const Offset(1.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: -1.0,
                color: const Color(0x33000000)),
            const BoxShadow(
                offset: const Offset(2.0, 1.0),
                blurRadius: 3.0,
                spreadRadius: 0.0,
                color: const Color(0x24000000)),
            const BoxShadow(
                offset: const Offset(3.0, 1.0),
                blurRadius: 4.0,
                spreadRadius: 2.0,
                color: const Color(0x1F000000)),
          ],
          image: new DecorationImage(
              fit: BoxFit.cover, image: new NetworkImage(widget.dog.imageUrl))),
    );
  }

  Widget get rating {
    return new Row(
      // Center the widgets on the main-axis
      // whch is the horizontal axis in a row
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.star,
          size: 40.0,
        ),
        new Text(' ${widget.dog.rating} / 10',
            style: Theme.of(context).textTheme.display2),
      ],
    );
  }

  Widget get dogProfile {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        ),
      ),
      // The Dog Profile information
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          new Text(
            widget.dog.name + '  🎾',
            style: new TextStyle(fontSize: 32.0),
          ),
          new Text(
            widget.dog.loc,
            style: new TextStyle(fontSize: 20.0),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: new Text(widget.dog.desc),
          ),
          rating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black38,
      appBar: new AppBar(
        backgroundColor: Colors.black38,
        title: new Text('Meet ${widget.dog.name}'),
      ),
      body: dogProfile,
    );
  }
}
