
import 'dart:io';

import 'package:drovakapp/common/rest.service.dart';
import 'package:drovakapp/models/uploadImageDTO.dart';
import 'package:drovakapp/screens/addComplaints.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';

class AddDetails extends StatefulWidget{

  File imageFile;
  AddDetails({Key key, @required this.imageFile}) : super(key : key);

  _AddDetails createState() => _AddDetails(imageFile);

}

class _AddDetails extends State<AddDetails>{

  File imageFile;
  _AddDetails(File imageFile){
    this.imageFile = imageFile;
  }
  RestService restService = new RestService();

  Future uploadPic(BuildContext context) async{
    String fileName = basename(imageFile.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;

    setState(() {
      print(firebaseStorageRef.getDownloadURL());
      firebaseStorageRef.getDownloadURL().then((action){
        print(action);
        UploadImageDTO uploadImageDto(){
          UploadImageDTO uploadImageDTO = new UploadImageDTO();
          uploadImageDTO.userId =  1;
          uploadImageDTO.vehicleId = "123";
          uploadImageDTO.regid = "123456";
          uploadImageDTO.feedbackId = 123;
          uploadImageDTO.image = action;

          return uploadImageDTO;
        }

        restService.uploadImage(uploadImageDto()).then((data) {
          if (data != null) {
            //print(data);
            //print(data.name);
            Toast.show("Picture uploaded successfully!", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new AddComplaints()));
            /*if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              SystemNavigator.pop();
            }*/
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


      });
      print("Profile Picture uploaded ");
      //Toast.show("Picture uploaded", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {

    print("####################### $imageFile");

    return new Scaffold(
        appBar: AppBar(
          title: Text("Add Details"),

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
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10),
                  color: Colors.blueAccent,
                  alignment: Alignment.center,
                  width: 280,
                  child: Column(
                    children: <Widget>[
                      Center(child : new Image(image: new FileImage(imageFile),)),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[200]))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Add Caption",

                              icon: Icon(Icons.title),
                              hintStyle:
                              TextStyle(color: Colors.white),
                              border: InputBorder.none),
                        ),
                      ),
                  ],
                ),

                ),
                SizedBox(height: 20,),
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
                        uploadPic(context);
                        //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new AddComplaints()));
                      },
                      child: new Text("Continue",style: TextStyle(color: Colors.white,fontSize: 16),),
                    ),
                  ),
                )
              ],
            ),
          ),
          ),
        ),
    );
  }



}