import 'package:drovakapp/common/rest.service.dart';
import 'package:drovakapp/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'dashBoard.dart';

class LoginScreen extends StatefulWidget{

  LoginScreen({Key key}) : super(key :key);

  _LogInScreen createState() => _LogInScreen();

}

class _LogInScreen extends State<LoginScreen>{

  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordControllre = new TextEditingController();




  @override
  Widget build(BuildContext context) {
    ProgressDialog pr = new ProgressDialog(context);

    return Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            image:  new DecorationImage(
              image: new ExactAssetImage('assets/Login_page_image.png'),
              fit: BoxFit.cover,

            ),
          ),
          child: new Container(

            child: new ListView(
              padding: const EdgeInsets.all(0.0),
              children: <Widget>[
                new Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(height: 40,),
                        new Container(
                            width: 190.0,
                            height: 190.0,
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              image:new DecorationImage(
                                image: new ExactAssetImage('assets/tick.png'),
                                fit: BoxFit.cover,),
                            )

                        ),

                        SizedBox(height: 7,),
                        new Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 35.0,fontWeight: FontWeight.w600),),
                        SizedBox(height: 5,),
                        new Text("Sign To Continue",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),

                        new Container(
                          margin: new EdgeInsets.symmetric(horizontal: 20.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Form(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      new Container(
                                        decoration: new BoxDecoration(
                                          border: new Border(
                                            bottom: new BorderSide(
                                              width: 0.5,
                                              color: Colors.white24,
                                            ),
                                          ),
                                        ),
                                        child: new TextFormField(
                                          obscureText: false,
                                          controller: userNameController,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: new InputDecoration(
                                            icon: new Icon(
                                              Icons.person,
                                              color: Colors.white,
                                            ),
                                            border: InputBorder.none,
                                            hintText: "UserName",
                                            hintStyle: const TextStyle(color: Colors.white, fontSize: 15.0),
                                            contentPadding: const EdgeInsets.only(
                                                top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
                                          ),
                                        ),
                                      ),
                                      new Container(
                                        decoration: new BoxDecoration(
                                          border: new Border(
                                            bottom: new BorderSide(
                                              width: 0.5,
                                              color: Colors.white24,
                                            ),
                                          ),
                                        ),
                                        child: new TextFormField(
                                          obscureText: false,
                                          controller: passwordControllre,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: new InputDecoration(
                                            icon: new Icon(
                                              Icons.lock,
                                              color: Colors.white,
                                            ),
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: const TextStyle(color: Colors.white, fontSize: 15.0),
                                            contentPadding: const EdgeInsets.only(
                                                top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Text(
                              "Forgot Password?      ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        // new Tick(image: tick),
                        SizedBox(height: 40,),
                        new InkWell(
                          onTap: (){
                            if(userNameController.text.length == 0 || passwordControllre.text.length == 0){

                              Toast.show("Please Enter UserName And Password", context, duration: Toast.LENGTH_LONG, gravity:Toast.BOTTOM);

                            }else{
                              pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
                              pr.show();
                              RestService restService = new RestService();
                              restService.getUser(userNameController.text,
                                  passwordControllre.text).then((
                                  onValue) async {
                                print("@@@@@@@@@@@@@@@@@@@@@@@@ $onValue");
                                if (onValue != null) {
                                  Toast.show(onValue.toString(), context, duration: Toast.LENGTH_LONG, gravity:Toast.BOTTOM);
                                  pr.hide();
                                  /*FlutterToast.showToast(
                                      msg: onValue.toString(),
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );*/
                                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                  sharedPreferences.setString("userName", onValue.name);
                                  print("ZZZZZZZZZZZZZZZ ${onValue.emailId}");
                                  sharedPreferences.setString("mobileNo", onValue.mobileNo);
                                  sharedPreferences.setString("emailId", onValue.emailId);
                                  sharedPreferences.setInt("UserId", onValue.id);
                                  Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBoard()),);
                                } else {
                                  pr.hide();
                                  Toast.show("Faild", context, duration: Toast.LENGTH_LONG, gravity:Toast.BOTTOM);
                                  /*FlutterToast.showToast(
                                      msg: "Faild",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );*/
                                }
                              }).catchError((error){
                                pr.hide();
                                Toast.show("Error!, Please Enter Valid Username And password", context, duration: Toast.LENGTH_LONG, gravity:Toast.BOTTOM);
                              });
                            }
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoard()),);
                          },
                          child: new Container(
                            width: 280.0,
                            height: 45.0,
                            alignment: FractionalOffset.center,
                            decoration: new BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: new BorderRadius.all(const Radius.circular(5.0)),
                            ),
                            child: new Text(
                              "SIGN IN",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),
                        /*Container(
                          width: 280.0,
                          height: 45.0,
                          alignment: FractionalOffset.center,
                          decoration: new BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: new BorderRadius.all(const Radius.circular(5.0)),
                          ),
                          child: FlatButton.icon(
                              onPressed: (){
                                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Register()));
                              },
                              icon: Image(image: ExactAssetImage("assets/FacebookSmall.png"),height: 25,width: 25,),
                              label: new Text(
                                "Connect With Facebook",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14.0),
                              )
                          ),
                        ),*/
                        SizedBox(height: 60,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Register()));
                          },
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              child: Text(
                                "Dont have an account?Signin",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

}