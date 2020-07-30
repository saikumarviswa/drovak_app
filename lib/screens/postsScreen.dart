import 'package:drovakapp/common/rest.service.dart';
import 'package:drovakapp/models/FeedBackDTO.dart';
import 'package:drovakapp/screens/singlePostScreen.dart';
import 'package:flutter/material.dart';

import '../Post.dart';

class PostsScreen extends StatefulWidget{

  PostsScreen({Key key}) : super(key : key);

  _PostScreen createState() => _PostScreen();


}

class _PostScreen extends State<PostsScreen>{

  final List<Post> _allPosts = Post.allPosts();
  List<FeedBackDTO> complaintList = new List();
  @override
  void initState(){
    super.initState();
    this.getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Container(
        child: new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: getHomePageBody(context)),
        ),
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

  void getData(){
    RestService restService = new RestService();
    restService.complaintsGet().then((data){

      if(data != null){
        this.setState((){
          complaintList = data;
        });

        print(complaintList.length);
        print(complaintList[1].regNumber);
        //FlutterToast.showToast(msg: data.toString());
      }else{
//        FlutterToast.showToast(msg: "Empty");
      }

    });
  }

}