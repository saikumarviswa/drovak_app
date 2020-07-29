
import 'package:flutter/material.dart';

class SinglePostScreen extends StatefulWidget{

  SinglePostScreen({Key key}) : super(key : key);

  _SinglePostScreen createState() => _SinglePostScreen();

}

class _SinglePostScreen extends State<SinglePostScreen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Post Page"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              new Card(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SinglePostScreen()));
                  },
                  child:new Container(
                    height: 250,
                    padding: EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      Container(
                        child: Text("AP23K1324 Driving Very Rash On Jubliee Hills Road no -12",style:TextStyle(color: Colors.blue,fontSize: 18.0,fontWeight: FontWeight.w400),),
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(height: 10,),
                      new Image.asset(
                        "assets/" + "compImage.png",
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
                          /*SizedBox(width: 25,),
                          Icon(Icons.message,color: Colors.blue[500],size: 20,),*/
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
              ),
              SizedBox(height: 15,),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Card(
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.access_time,color: Colors.red[500],size: 30,),
                        SizedBox(width: 15,),
                        Center(
                          child: Column(
                            children: <Widget>[
                              Text("January 12th 2019",style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.w600),),
                              SizedBox(height: 5,),
                              Text("7:48 PM",style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ),
                        SizedBox(width: 55,),
                        Center(
                          child: Column(
                            children: <Widget>[
                              Text("Kompally,Hyderabad",style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.w600),),
                              SizedBox(height: 5,),
                              Text("Telengana India",style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ),
                        Icon(Icons.location_on,color: Colors.blue[500],size: 30,),

                      ],
                    ),

                  ),
                ),
              ),

              SizedBox(height: 15,),
              Container(
                child:Card(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text("Description",style: TextStyle(color: Colors.grey[800],fontSize: 25,fontWeight: FontWeight.w700),),
                          alignment: Alignment.bottomLeft,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Lorem Ipsum is simply dummy text of the typing and typesetting industry. Lorem Ipsum has been the industrys standars dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries but also the leep into electronic typesetting, remaining essentially unchanged",style: TextStyle(color: Colors.grey[500],fontSize: 16,fontWeight: FontWeight.w400),),
                          alignment: Alignment.bottomLeft,
                        ),


                      ],
                    ),
                  ),
                )

              ),/*
              Container(
                alignment: Alignment.bottomCenter,
                child: Card(
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20,),
                        Icon(Icons.person,color: Colors.black,size: 40,),
                        SizedBox(width: 10,),
                        Column(
                          children: <Widget>[
                            Text("Sampat Kumar",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Text("like",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),
                                  SizedBox(width: 30,),
                                  Text("Replay",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),

                                ],
                              ),
                            )


                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: <Widget>[
                            Text("Sampat Kumar",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Text("- 10hrs ago",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),
                                  *//*SizedBox(width: 30,),
                                  Text("Replay",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),*//*

                                ],
                              ),
                            )


                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Card(
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20,),
                        Icon(Icons.person,color: Colors.black,size: 40,),
                        SizedBox(width: 10,),
                        Column(
                          children: <Widget>[
                            Text("Sampat Kumar",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Text("like",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),
                                  SizedBox(width: 30,),
                                  Text("Replay",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),

                                ],
                              ),
                            )


                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          children: <Widget>[
                            Text("Sampat Kumar",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Text("- 10hrs ago",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),
                                  *//*SizedBox(width: 30,),
                                  Text("Replay",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),*//*

                                ],
                              ),
                            )


                          ],
                        )

                      ],
                    ),
                  ),
                ),
              )*/


            ],
          ),
        )
      ),

    );
  }

}