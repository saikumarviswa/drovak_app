import 'package:drovakapp/postsWidget.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget{

  PostsScreen({Key key}) : super(key : key);

  _PostScreen createState() => _PostScreen();


}

class _PostScreen extends State<PostsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Posts(),
    );
  }

}