import 'package:flutter/material.dart';

class IconHolder extends StatelessWidget {
  final icon;
  IconHolder(this.icon);
  @override
  Widget build(BuildContext context){
    return new Container(
      height: 350.0,
      child: new Stack(
        children: <Widget>[
          new Positioned(
            right: -60.0,
            child: new Image(
              width: 350.0,
              image: new AssetImage('assets/icons/'+icon+'.png'),
            ),
          )
        ],
      ),
    );
  }
}