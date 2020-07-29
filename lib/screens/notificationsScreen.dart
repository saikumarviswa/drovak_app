
import 'package:drovakapp/NotificationItem.dart';
import 'package:flutter/material.dart';

import '../notif.dart';

class NotificationsScreen extends StatefulWidget{

  NotificationsScreen({Key key}) : super(key : key);

  _NotificationsScreen createState() => _NotificationsScreen();

}

class _NotificationsScreen extends State<NotificationsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: new Scaffold(
        body: new Container(
          width: double.infinity,
            decoration: new BoxDecoration(
              image:  new DecorationImage(
                image: new ExactAssetImage('assets/login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          child:Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: <Color>[
                  const Color.fromRGBO(0,0,255,0.5),
                  const Color.fromRGBO(51, 51, 63, 0.9),
                ],
                stops: [0.2, 1.0],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
              ),
            ),
            child: new CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  sliver: new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                          (context, index) => new NotificationItem(nots[index]),
                      childCount: nots.length,
                    ),
                  ),
                ),
              ],
            ),
          )

        ),
      ),
    );
  }

}