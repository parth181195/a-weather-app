import 'package:flutter/material.dart';

class WeatherText extends StatelessWidget {
  final temperature;
  WeatherText(this.temperature);
  @override
  Widget build(BuildContext context){
    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text("it's",
            textAlign: TextAlign.left,
            style:new TextStyle(
              fontFamily: "Rubik Mono One",
              fontSize: 45.0,
              letterSpacing: -4.0,
              color: Colors.black,
            )
          ),
          new Text(temperature+'°C',
            textAlign: TextAlign.left,
            style:new TextStyle(
              fontFamily: "Rubik Mono One",
              fontSize: 50.0,
              color: Colors.black
            )
          ),
          new Text('Love is in the air',
            textAlign: TextAlign.left,
            style:new TextStyle(
              fontSize: 20.0,
              color: const Color(0xFF919191)
            )
          ),
        ],
      ),
    );
  }
}