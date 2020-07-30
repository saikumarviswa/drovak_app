
import 'package:drovakapp/common/rest.service.dart';
import 'package:drovakapp/models/FeedBackDTO.dart';
import 'package:drovakapp/screens/postsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import '../FadeAnimation.dart';

class AddComplaints extends StatefulWidget{

  String imageFile;
  AddComplaints({Key key, @required this.imageFile}) : super(key : key);

  _AddComplaints createState() => _AddComplaints(imageFile);
}

class _AddComplaints extends State<AddComplaints>{

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  TextEditingController vehicNoController = new TextEditingController();
  TextEditingController areaController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();


  String imageLink;
  _AddComplaints(String imageLink){
    this.imageLink = imageLink;
  }


  @override
  void initState() {
    super.initState();
    this._getAddressFromLatLng();
    this._loadCounter();
  }

  RestService restService = new RestService();
  FeedBackDTO prepareFedback(){
    FeedBackDTO feedBackDTO = new FeedBackDTO();

    /*FeedbackTypeDTO feedbackTypeDTO = new FeedbackTypeDTO();
    feedbackTypeDTO.id = 1;
    feedbackTypeDTO.description = "Rash Driving";
    feedbackTypeDTO.name = vehicNoController.text;
    feedbackTypeDTO.isActive = true;

    LogInTypeDTO logInTypeDTO = new LogInTypeDTO();
    logInTypeDTO.id = 1;
    logInTypeDTO.description = "Rash Driving";
    logInTypeDTO.name = vehicNoController.text;
    logInTypeDTO.isActive = true;

    StatusTypeDTO statusTypeDTO = new StatusTypeDTO();
    statusTypeDTO.id = 1;
    statusTypeDTO.description = "Rash Driving";
    statusTypeDTO.name = vehicNoController.text;
    statusTypeDTO.isActive = true;*/


    feedBackDTO.regNumber = vehicNoController.text;
    feedBackDTO.location = areaController.text;
    feedBackDTO.comments = descriptionController.text;
    feedBackDTO.isActive = true;
    feedBackDTO.imagePath = imageLink;
    /*feedBackDTO.lat =_currentPosition.latitude.toString();
    feedBackDTO.lon = _currentPosition.longitude.toString();
    feedBackDTO.location =_currentAddress;*/
    feedBackDTO.isPositive = false;
    feedBackDTO.status = 1; //new complaint
    feedBackDTO.regId = userId; //TODO
    feedBackDTO.createdBy = userId;  //TODO
    feedBackDTO.feedBackTypeId = 1;
    feedBackDTO.loginTypeId = 1;


    return feedBackDTO;
    //print(_currentPosition.latitude.toString());
  }

  String userName;
  String mobileNumber;
  String emailId;
  int userId;

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      userName = (prefs.getString('userName') ?? null);
      mobileNumber = (prefs.getString('mobileNo') ?? null);
      emailId = (prefs.getString('emailId') ?? null);
      userId = (prefs.getInt("userId") ?? null);
    });
  }


  @override
  Widget build(BuildContext context) {


    areaController.text = _currentAddress;
    print("!!!!!!!!!!!!!!!!!!! $_currentAddress");

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
                    Expanded(
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
                                        controller: vehicNoController,
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
                                        controller: areaController,
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
                                        controller: descriptionController,
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
                                      print("************************** ${vehicNoController.text}");
                                      restService.complaintPost(prepareFedback()).then((data) {
                                        print(data);
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
                                          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PostsScreen()));

                                          /*if (Navigator.canPop(context)) {
                                      Navigator.pop(context);
                                    } else {
                                      SystemNavigator.pop();
                                    }*/
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
                                        print(error);
                                        Toast.show("Error ", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                        /*FlutterToast.showToast(
                                                msg: "Error",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);*/
                                        /*if (Navigator.canPop(context)) {
                                          Navigator.pop(context);
                                        } else {
                                          SystemNavigator.pop();
                                        }*/
                                      });
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


                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.name}";
      });
    } catch (e) {
      print(e);
    }
  }

}