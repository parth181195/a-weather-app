import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'About.dart';
import 'Loading.dart';
import 'IconHolder.dart';
import 'WeatherText.dart';

class WeatherApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return new MaterialApp(
      home: new LoadingPage(),
      routes: <String, WidgetBuilder>{
        "/about": (BuildContext context) => new AboutPage()
      },
    );
  }
}

class HomePage extends StatefulWidget{
  final data;
  HomePage(this.data);
  @override
  HomePageState createState() => new HomePageState(data);
}

class HomePageState extends State<HomePage>{
  final data;
  var temp;
  HomePageState(this.data);
  initState() {
    super.initState();
    temp = (data['currently']['temperature']-32)*(5/9);
  }
  @override
  Widget build(BuildContext context){
    final double statusBarHeight = MediaQuery
    .of(context)
    .padding
    .top;
  print(data);
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.only(top: statusBarHeight+20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new IconHolder(data['currently']['icon']),
            new WeatherText(temp.round().toString()),
          ],
        ),
      ),
    );
  }
}