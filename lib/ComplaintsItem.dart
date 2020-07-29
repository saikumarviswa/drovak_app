
import 'package:drovakapp/FadeAnimation.dart';
import 'package:flutter/material.dart';

class ComplaintsItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FadeAnimation(1,
      new Container(
        child: new Card(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage('asset/tick.png'),
              )
            ],
          ),
        ),
      )

    );
  }

}