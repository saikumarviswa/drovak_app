

import 'package:drovakapp/common/rest.service.dart';
import 'package:drovakapp/models/RegistrationModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import '../FadeAnimation.dart';


class Register extends StatefulWidget{

  Register({Key key}) : super(key : key);

  _Register createState() => _Register();

}

class _Register extends State<Register>{


  DateTime selectedDate = DateTime.now();
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController userNameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController conformPasswordController = new TextEditingController();
  TextEditingController insuranceNoController = new TextEditingController();
  RestService restService = new RestService();


  RegistrationModel prepareRegistration(){
    RegistrationModel registrationModel = new RegistrationModel();
    registrationModel.name =  userNameController.text;
    registrationModel.city = "";
    registrationModel.gender = "Male";
    registrationModel.mobileNo = mobileController.text;
    registrationModel.emailId = emailController.text;
    registrationModel.isActive = true;
    registrationModel.createdBy = 123;
    registrationModel.password = passwordController.text;
    registrationModel.roleId = 1;
    return registrationModel;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new ExactAssetImage('assets/Login_page_image.png'),
                fit:BoxFit.cover
            )
          ),
          child: new Container(
              /*decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: <Color>[
                      const Color.fromRGBO(255,0,0,0.5),
                      const Color.fromRGBO(51, 51, 63, 0.9),
                    ],
                    stops: [0.2, 1.0],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  )
              ),*/
            child: new Column(

              children: <Widget>[

                SizedBox(height: 30,),
                new Container(
                    width: 140.0,
                    height: 140.0,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      image:new DecorationImage(
                        image: new ExactAssetImage('assets/tick.png'),
                        fit: BoxFit.cover,),
                    )

                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                                1.4,
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(225, 95, 27, .3),
                                            blurRadius: 20,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: <Widget>[

                                      Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                      SizedBox(height: 20),
                                      InkWell(
                                        onTap:(){

                                        },
                                        child: Container(
                                            width: 92.0,
                                            height: 92.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(80.0),
                                              border: Border.all(
                                                color: Colors.blueAccent,
                                                width: 2.0,
                                              ),

                                            ),
                                            child: Center(child : new Icon(Icons.camera_alt,size: 40,color: Colors.black,))
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextField(
                                          controller: userNameController,
                                          decoration: InputDecoration(
                                              hintText: "Full Name",
                                              icon: Icon(Icons.person),
                                              hintStyle:
                                              TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextField(
                                          controller: mobileController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: "Mobile",
                                              icon: Icon(Icons.call),
                                              hintStyle:
                                              TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextField(
                                          controller: emailController,
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              hintText: "Email",
                                              icon: Icon(Icons.email),
                                              hintStyle:
                                              TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextField(
                                          controller: passwordController,
                                          keyboardType: TextInputType.visiblePassword,
                                          decoration: InputDecoration(
                                              hintText: "Password",
                                              icon: Icon(Icons.lock),
                                              hintStyle:
                                              TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]))),
                                        child: TextField(
                                          controller: conformPasswordController,
                                          decoration: InputDecoration(
                                              hintText: "Re Type Password",
                                              icon: Icon(Icons.lock),
                                              hintStyle:
                                              TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[200]
                                                )
                                            )
                                        ),
                                        child: TextField(
                                          controller: insuranceNoController,
                                          decoration: InputDecoration(
                                              hintText: "Insurance No",
                                              icon: Icon(Icons.confirmation_number),
                                              hintStyle:
                                              TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Pollution",style: TextStyle(color: Colors.white),),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 130,
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                children: <Widget>[
                                                  new Text("Start",style: TextStyle(color: Colors.blueAccent),),
                                                  SizedBox(height: 7,),
                                                  Container(
                                                    padding: EdgeInsets.all(1),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Colors.grey[200]))),
                                                    child: InkWell(
                                                      onTap: (){
                                                        _selectDate(context);
                                                      },
                                                      child: Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(color:Colors.white,fontSize: 18),),
                                                    )
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 15,),
                                            Container(
                                              width: 130,
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                children: <Widget>[
                                                  new Text("End",style: TextStyle(color: Colors.blueAccent),),
                                                  SizedBox(height: 7,),
                                                  Container(
                                                    padding: EdgeInsets.all(1),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Colors.grey[200]))),
                                                    child: InkWell(
                                                      onTap: (){
                                                        _selectDate(context);
                                                      },
                                                      child: Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(color:Colors.white,fontSize: 18),),
                                                    )
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 30,),
                                      InkWell(
                                        onTap: (){

                                          if(userNameController.text.length > 0 && mobileController.text.length == 10 && emailController.text.length > 0 && passwordController.text.length >= 6) {
                                            if(passwordController.text == conformPasswordController.text) {
                                              verifyPhone();
                                            }else{
                                              Toast.show("Password Mismatch, Please Enter Valid Password", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                            }
                                          }else if(userNameController.text.length > 0 && mobileController.text.length != 10 && emailController.text.length > 0){
                                            Toast.show("Please Enter Valid Mobile Number", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                          }else{
                                            Toast.show("Please Enter Required Fields", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                          }
                                          /*restService.registerUser(prepareRegistration()).then((data) {
                                            if (data != null) {
                                              //print(data.name);
                                              Toast.show("Registration completed successfully!", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                              *//*FlutterToast.showToast(
                                                  msg: "Registration completed successfully!",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);*//*
                                              if (Navigator.canPop(context)) {
                                                Navigator.pop(context);
                                              } else {
                                                SystemNavigator.pop();
                                              }
                                            } else {
                                              Toast.show("Failed", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                              *//*FlutterToast.showToast(
                                                  msg: "Failed",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);*//*
                                              if (Navigator.canPop(context)) {
                                                Navigator.pop(context);
                                              } else {
                                                SystemNavigator.pop();
                                              }
                                            }
                                          }).catchError((error) {
                                            Toast.show("Error", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                                            *//*FlutterToast.showToast(
                                                msg: "Error",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);*//*
                                            if (Navigator.canPop(context)) {
                                              Navigator.pop(context);
                                            } else {
                                              SystemNavigator.pop();
                                            }
                                          });*/
                                        },
                                        child: new Container(
                                          width: 280.0,
                                          height: 45.0,
                                          alignment: FractionalOffset.center,
                                          decoration: new BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: new BorderRadius.all(const Radius.circular(5.0)),
                                          ),
                                          child: new Text(
                                            "SIGN UP",
                                            style: new TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.3,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 30,),
                                      /*Container(
                                        width: 280.0,
                                        height: 45.0,
                                        alignment: FractionalOffset.center,
                                        decoration: new BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: new BorderRadius.all(const Radius.circular(5.0)),
                                        ),
                                        child: FlatButton.icon(
                                            onPressed: (){
                                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Register()));
                                            },
                                            icon: Image(image: ExactAssetImage("assets/FacebookSmall.png"),height: 25,width: 25,),
                                            label: new Text(
                                              "SignUp With Facebook",
                                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18.0),
                                            )
                                        ),
                                      )*/
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
        )
    );
  }

  void saveReg(){
    restService.registerUser(prepareRegistration()).then((data) {
      if (data != null) {
        //print(data);
        //print(data.name);
        Toast.show("Registration completed successfully!", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          SystemNavigator.pop();
        }
      } else {
        Toast.show("Faild", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          SystemNavigator.pop();
        }
      }
    }).catchError((error) {
      Toast.show("Error", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      } else {
        SystemNavigator.pop();
      }
    });
  }

  Future<void> verifyPhone() async {
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ");
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context).then((value) {
        print('sign in');
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! $value");
      });
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber:
          "+91" + mobileController.text, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;

          },
          codeSent:
          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 30),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
            Toast.show("User Verified", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);


            restService.registerUser(prepareRegistration()).then((data) {
              if (data != null) {
                // print(data);
                // print(data.name);
                Toast.show("Registration completed Successfully!", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);

                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  SystemNavigator.pop();
                }
              } else {
                Toast.show("Faild", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  SystemNavigator.pop();
                }
              }
            }).catchError((error) {
              Toast.show("Error", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                SystemNavigator.pop();
              }
            });
          },
          verificationFailed: (AuthException exceptio) {
            print('${exceptio.message}');
          });
    } catch (e) {
      handleError(e);
    }
  }



  Future<bool> smsOTPDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter SMS Code'),
            content: Container(
              height: 85,
              child: Column(children: [
                TextField(
                  onChanged: (value) {
                    this.smsOTP = value;
                  },
                ),
                (errorMessage != ''
                    ? Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                )
                    : Container())
              ]),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                child: Text('Submit'),
                onPressed: () {
                  _auth.currentUser().then((user) {
                    if (user != null) {
                      restService.registerUser(prepareRegistration()).then((data) {
                        if (data != null) {
                          //print(data.name);
                          Toast.show("Registration completed Successfully!", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            SystemNavigator.pop();
                          }
                        } else {
                          Toast.show("Faild", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            SystemNavigator.pop();
                          }
                        }
                      }).catchError((error) {
                        Toast.show("Error", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          SystemNavigator.pop();
                        }
                      });

                      //FlutterToast.showToast(msg: "Hello");
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    } else {
                      //FlutterToast.showToast(msg: "Hello1111111111111");
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final FirebaseUser user =
      (await _auth.signInWithCredential(credential)) as FirebaseUser;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      restService.registerUser(prepareRegistration()).then((data) {
        if (data != null) {
          //print(data.name);
          Toast.show("Registration completed Successfully!", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);

          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            SystemNavigator.pop();
          }
        } else {
          Toast.show("Faild", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            SystemNavigator.pop();
          }
        }
      }).catchError((error) {
        Toast.show("Error", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          SystemNavigator.pop();
        }
      });
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    } catch (e) {
      handleError(e);
    }
  }

  handleError(Object error) {
    print(error);
    switch (error.toString()) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        errorMessage = 'Invalid Code';
        print(errorMessage);
        Navigator.of(context).pop();
        smsOTPDialog(context).then((value) {
          print('sign in');
        });
        break;
      default:
        errorMessage = error.toString();
        print(errorMessage);

        break;
    }
  }

}