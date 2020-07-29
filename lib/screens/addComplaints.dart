
import 'package:drovakapp/common/rest.service.dart';
import 'package:drovakapp/models/FeedBackDTO.dart';
import 'package:drovakapp/screens/postsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import '../FadeAnimation.dart';

class AddComplaints extends StatefulWidget{

  AddComplaints({Key key}) : super(key : key);

  _AddComplaints createState() => _AddComplaints();
}

class _AddComplaints extends State<AddComplaints>{

  TextEditingController vehicNoController = new TextEditingController();
  TextEditingController areaController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();


  RestService restService = new RestService();
  FeedBackDTO prepareFedback(){
    FeedBackDTO feedBackDTO = new FeedBackDTO();
    feedBackDTO.regNumber = vehicNoController.text;
    feedBackDTO.location = areaController.text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Complaints"),

        ),
        body: Container(
          decoration: new BoxDecoration(
            image:  new DecorationImage(
              image: new ExactAssetImage('assets/login.jpg'),
                fit: BoxFit.cover,
            ),
          ),
          child: Container(
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
                    SizedBox(height: 20,),
                    FadeAnimation(1,
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 10,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Enter Vehicle No",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    FadeAnimation(1.3,
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 10,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Enter Area",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    FadeAnimation(1.6,
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 10,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                      hintText: "Enter Description",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    FadeAnimation(1.9,
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 10,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 20,),
                                      new Text("HOW WAS THE",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue,fontSize: 25),),
                                      new Text("VEHICLE DRIVING",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue,fontSize: 25),),
                                      SizedBox(height: 20,),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 10,),
                                          Column(
                                            children: <Widget>[
                                              InkWell(
                                                onTap: (){

                                                },
                                                child: Container(
                                                    width: 150,
                                                    alignment: Alignment.center,
                                                    child: Icon(Icons.thumb_up,size: 100,color: Colors.grey,)

                                                ),
                                              ),
                                              SizedBox(height: 5,),
                                              Text("Good",style: TextStyle(color: Colors.blue,fontSize: 15),)
                                            ],

                                          ),
                                          SizedBox(width: 10,),
                                          Column(
                                            children: <Widget>[
                                              InkWell(
                                                onTap: (){

                                                },
                                                child: Container(
                                                    width: 150,
                                                    alignment: Alignment.center,
                                                    child: Icon(Icons.thumb_down,size: 100,color: Colors.grey,)

                                                ),
                                              ),
                                              SizedBox(height: 5,),
                                              Text("Bad",style: TextStyle(color: Colors.blue,fontSize: 15),)

                                            ],
                                          ),
                                          SizedBox(width: 10,)

                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(height: 20,),
                    FadeAnimation(2.2,
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 45),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.red,
                            height: 40,
                            width: 100,
                            child: InkWell(
                              onTap: (){
                                restService.complaintPost(prepareFedback()).then((data) {
                                  if (data != null) {
                                    //print(data.name);
                                    Toast.show("Complaiant Posted successfully!", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                    /*FlutterToast.showToast(
                                                  msg: "Registration completed successfully!",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);*/
                                    if (Navigator.canPop(context)) {
                                      Navigator.pop(context);
                                    } else {
                                      SystemNavigator.pop();
                                    }
                                  } else {
                                    Toast.show("Failed", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                    /*FlutterToast.showToast(
                                                  msg: "Failed",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);*/
                                    if (Navigator.canPop(context)) {
                                      Navigator.pop(context);
                                    } else {
                                      SystemNavigator.pop();
                                    }
                                  }
                                }).catchError((error) {
                                  Toast.show("Error", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                  /*FlutterToast.showToast(
                                                msg: "Error",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);*/
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  } else {
                                    SystemNavigator.pop();
                                  }
                                });
                                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PostsScreen()));
                                //FlutterToast.showToast(msg: "Submit Successful");
                              },
                              child: new Text("Submit",style: TextStyle(color: Colors.white,fontSize: 16),),
                            ),
                          ),
                        )
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

}