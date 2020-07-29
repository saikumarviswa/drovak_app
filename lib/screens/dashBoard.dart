



import 'package:drovakapp/screens/loginScreen.dart';
import 'package:drovakapp/screens/postsScreen.dart';
import 'package:drovakapp/screens/takeImage.dart';
import 'package:drovakapp/screens/userProfile.dart';
import 'package:drovakapp/screens/yourVehicles.dart';
import 'package:flutter/material.dart';
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';

import '../Post.dart';
import 'notificationsScreen.dart';

class DashBoard extends StatefulWidget{

  DashBoard({Key key}) : super(key : key);

  _DashBoard createState() => _DashBoard();

}

class _DashBoard extends State<DashBoard>{

  PageController pageController = new PageController(initialPage: 999);
  final List<Post> _allPosts = Post.allPosts();


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: AppBar(
        title: Text("Home"),

        actions: <Widget>[

          InkWell(
            child: Image(image : new ExactAssetImage("assets/new_releases.png",),height: 25,width: 25,),
            onTap: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          ),
          /*new CircleAvatar(
              backgroundImage: new NetworkImage("https://randomuser.me/api/portraits/women/44.jpg")
          )*/
          /*InkWell(
            onTap:(){

            },
            child: Container(
                width: 25.0,
                height: 25.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80.0),
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),

                ),
                child: Center(child : new Icon(Icons.camera_alt,size: 20,color: Colors.black,))
            ),
          ),*/

        ],
      ),
      drawer: new Drawer(
        child: new Container(
          color: Colors.blue[900],
          child: new ListView(
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          child: new GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new UserProfile()));
                            },
                            child: new CircleAvatar(

                                backgroundImage: new NetworkImage("https://randomuser.me/api/portraits/women/44.jpg")
                            ),
                          ),
                        ),
                        Text("Ramesh Kumar",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                        Text("Hyderabad,INDIA",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),)

                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                ),
              ),

              new ListTile(
                title: Row(
                  children: <Widget>[
                    new Image(image: new ExactAssetImage('assets/post_box.png'),height: 25,width: 25,),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Posts",style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PostsScreen()));
                },
              ),
              new ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.notifications,color: Colors.white,),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("Notification",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new NotificationsScreen()));
                  }
              ),
              new ListTile(
                  title: Row(
                    children: <Widget>[
                      new Image(image: new ExactAssetImage('assets/profile.png'),height: 25,width: 25,),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("Profile",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new UserProfile()));
                  }
              ),new ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.directions_bike,color: Colors.white,),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("Your Vehicles",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new YourVehicles()));
                  }
              ),
              new ListTile(
                  title: Row(
                    children: <Widget>[
                      new Image(image: new ExactAssetImage('assets/logout.png'),height: 25,width: 25,),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("LogOut",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RichAlertDialog(
                            alertTitle: richTitle("Are You Sure?"),
                            alertSubtitle: richSubtitle("You Want To Logout"),
                            alertType: RichAlertType.WARNING,
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Yes"),
                                onPressed: (){
                                  Navigator.pop(context,true);
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
                                  },
                              ),
                              FlatButton(
                                child: Text("No"),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                    //Navigator.of(context).pop();
                    //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ReceivedPosts()));
                  }
              ),
              /*new ListTile(
                        title: new Text("About Us"),
                        trailing: new Icon(Icons.people),
                        onTap: () {

                          Navigator.of(context).pop();
                          //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("Second Page")));
                        }
                    ),*/


            ],
          ),
        ),

      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        color: Colors.yellow,
                        child: new PageView.builder(
                          controller: pageController,
                          itemBuilder: (context, index) {
                            return new Center(
                              child: new Text('Banner number ${index % 5}'),
                            );
                          },
                          reverse: true,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: size.height * 0.6,
                        child: new Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                            child: getHomePageBody(context)
                        ),
                      ),
                      /*new CustomScrollView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        slivers: <Widget>[
                          new SliverPadding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            sliver: new SliverList(
                              delegate: new SliverChildBuilderDelegate(
                                      (context, index) => ComplaintsItem(),
                                childCount: 1
                              ),
                            ),
                          ),
                        ],
                      ),*/
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.red[900],
          onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new TakeImage()));
          },
        child: Icon(Icons.add,color: Colors.white,size: 50,),
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
          //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SinglePostScreen()));
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
                Icon(Icons.message,color: Colors.blue[500],size: 20,),
                SizedBox(width: 25,),
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