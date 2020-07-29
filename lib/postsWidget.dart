
import 'dart:ui';

import 'package:drovakapp/screens/singlePostScreen.dart';
import 'package:flutter/material.dart';

import 'Post.dart';

class Posts extends StatelessWidget{

  final List<Post> _allPosts = Post.allPosts();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: getHomePageBody(context)),
    );
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allPosts.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SinglePostScreen()));
          },
          child:new Container(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Container(
                child: Text(_allPosts[index].name,style:TextStyle(color: Colors.blue,fontSize: 18.0,fontWeight: FontWeight.w400),),
                alignment: Alignment.bottomLeft,
              ),
              SizedBox(height: 10,),
              new Image.asset(
                "assets/" + _allPosts[index].image,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Icon(Icons.thumb_up,color: Colors.green[500],size: 20,),
                  SizedBox(width: 10,),
                  Text("256"),
                  SizedBox(width: 10,),
                  Icon(Icons.thumb_down,color: Colors.red[500],size: 20,),
                  SizedBox(width: 10,),
                  Text("256"),
                  SizedBox(width: 25,),
                  /*Icon(Icons.message,color: Colors.blue[500],size: 20,),
                  SizedBox(width: 25,),*/
                  Icon(Icons.share,color: Colors.blue[500],size: 20,),
                  SizedBox(width: 35,),
                  Text("Hyderabad"),
                  SizedBox(width: 10,),
                  Icon(Icons.location_on,color: Colors.blue[500],size: 20,),
                ],
              )

            ]
            ),
          ),
        ),
    );
  }

}