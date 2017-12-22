import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'Home.dart';

class LoadingPage extends StatefulWidget{
  @override
  LoadingPageState createState() => new LoadingPageState();
}


class LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  Location _location = new Location();
  var curentLoation = {};
  String tagline;
  List taglines = [
    "Asking Yanet García for weather report",
    "Building a Wall to protect your weather report",
    "Asking Al Roker for weather report",
    "Asking astronauts for weather report",
  ];
  initState() {
    super.initState();
    tagline = taglines[new Random().nextInt(3)];
    animationStarter();
    getLocation();
  }
  getLocation() async {
      Map<String,double> location;
        location = await _location.getLocation;
        curentLoation['longitude'] = location['longitude'].toString();
        curentLoation['latitude'] = location['latitude'].toString();
        print(curentLoation);
        await getWeather();
  }

  Future<String> getWeather() async {
    var url = 'https://api.darksky.net/forecast/b2e0ba6e60d09fd5dcf6ced9757bbc30/'+curentLoation['latitude'].toString()+','+curentLoation['longitude'].toString()+'?exclude=hourly,daily,alerts,flags,flags';
    print(url);
    http.Response response = await http.get(
      Uri.encodeFull(url),
      headers: {
        'Accept' : "application/json"
      },
    );
    var data = JSON.decode(response.body);
    data['currently']['temperature'] = (data['currently']['temperature']-32)*(5/9);
    controller.dispose();
    // // super.dispose();
    print(data);
    await Navigator.pushReplacement(context, new MaterialPageRoute(
      builder: (BuildContext context) => new HomePage(data)
    ));
  }
  void animationStarter() {
    controller = new AnimationController(
    duration: const Duration(milliseconds: 10000), vsync: this);
    animation = new Tween(begin: 0.0, end: 360).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
  final double statusBarHeight = MediaQuery
    .of(context)
    .padding
    .top;
  final double navBarHeight = MediaQuery
    .of(context)
    .padding
    .bottom;
    return new Scaffold(
      backgroundColor: Colors.white,
      body : new Container(
        padding: new EdgeInsets.only(top: statusBarHeight+(navBarHeight/2)),
        decoration: new BoxDecoration(
          color: Colors.white,
          // image: image
        ),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Transform.rotate(
                angle: (animation.value*(22/7))/180,
                child: new Image(
                  image: new AssetImage("assets/icons/clear-day.png"),
                  width: 250.0,
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(top: 100.0,bottom: 5.0),
                child: new Text(tagline),
              ),
            ],
          ),
      ),
      )
    );
  }
}


