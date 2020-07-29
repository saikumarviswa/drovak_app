

import 'package:drovakapp/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../FadeAnimation.dart';

class UserProfile extends StatefulWidget{

  UserProfile({Key key}) : super(key : key);

  _UserProfile createState() => _UserProfile();


}

class _UserProfile extends State<UserProfile>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        decoration: new BoxDecoration(
          image:  new DecorationImage(
            image: new ExactAssetImage('assets/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            alignment: Alignment.center,
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
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60))),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                FadeAnimation(
                                    1.4,
                                    Container(
                                      width: 450,
                                      padding: EdgeInsets.only(right: 5,left: 5,top: 20,bottom: 40),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(225, 95, 27, .3),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
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
                                          Text("Ramesh Kumar",style: TextStyle(color: Colors.blue[900],fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("Hyderabad,INDIA",style: TextStyle(color: Colors.blue[900],fontSize: 15,fontWeight: FontWeight.w300),),
                                          SizedBox(height: 10,),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text("Name",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400)),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            alignment: Alignment.center,
                                            //padding: EdgeInsets.only(right: 45),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.all(5),
                                              color: Colors.grey[300],
                                              height: 40,
                                              width: 380,
                                              child: InkWell(
                                                onTap: (){

                                                },
                                                child: new Text("Ramesh Kumar",style: TextStyle(color: Colors.black,fontSize: 16),),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text("Mobile",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400)),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            alignment: Alignment.center,
                                            //padding: EdgeInsets.only(right: 45),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.all(5),
                                              color: Colors.grey[300],
                                              height: 40,
                                              width: 380,
                                              child: InkWell(
                                                onTap: (){

                                                },
                                                child: new Text("9949204432",style: TextStyle(color: Colors.black,fontSize: 16),),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text("Password",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400)),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            alignment: Alignment.center,
                                            //padding: EdgeInsets.only(right: 45),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.all(5),
                                              color: Colors.grey[300],
                                              height: 40,
                                              width: 380,
                                              child: InkWell(
                                                onTap: (){

                                                },
                                                child: new Text("********",style: TextStyle(color: Colors.black,fontSize: 16),),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text("Insurance Nno",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400)),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            alignment: Alignment.center,
                                            //padding: EdgeInsets.only(right: 45),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.all(5),
                                              color: Colors.grey[300],
                                              height: 40,
                                              width: 380,
                                              child: InkWell(
                                                onTap: (){

                                                },
                                                child: new Text("345378FG45",style: TextStyle(color: Colors.black,fontSize: 16),),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text("Pollution",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400)),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            color: Colors.grey[300],
                                            padding: EdgeInsets.only(right: 30,left: 30),
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  width: 130,
                                                  alignment: Alignment.centerLeft,

                                                  child: Column(
                                                    children: <Widget>[
                                                      new Text("Start",style: TextStyle(color: Colors.black),),
                                                      SizedBox(height: 7,),
                                                      Container(
                                                        padding: EdgeInsets.all(1),
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                                bottom: BorderSide(
                                                                    color: Colors.grey[200]))),
                                                        child: Text("02-June-2020",style: TextStyle(color: Colors.black,fontSize: 16))
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 40,),
                                                Container(
                                                  width: 130,
                                                  alignment: Alignment.centerLeft,
                                                  child: Column(
                                                    children: <Widget>[
                                                      new Text("End",style: TextStyle(color: Colors.black),),
                                                      SizedBox(height: 7,),
                                                      Container(
                                                        padding: EdgeInsets.all(1),
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                                bottom: BorderSide(
                                                                    color: Colors.grey[200]))),
                                                        child: Text("02-Nov-2020",style: TextStyle(color: Colors.black,fontSize: 16))
                                                      ),


                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(height: 20,),
                                          Container(
                                            alignment: Alignment.center,
                                            child: Container(
                                              alignment: Alignment.center,
                                              color: Colors.blue[900],
                                              height: 40,
                                              child: InkWell(
                                                onTap: (){
                                                },
                                                child: new Text("Save",style: TextStyle(color: Colors.white,fontSize: 16),),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {

        },
      ),*/

    );
  }

}