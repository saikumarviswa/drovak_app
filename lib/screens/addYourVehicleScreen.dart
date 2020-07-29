
import 'dart:io';

import 'package:drovakapp/common/rest.service.dart';
import 'package:drovakapp/models/vehicleDTO.dart';
import 'package:drovakapp/models/vehicleMakeTypeDTO.dart';
import 'package:drovakapp/models/vehicleTypeDTO.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
/*import 'package:fluttertraffic/common/rest.service.dart';
import 'package:fluttertraffic/models/VehicleDTO.dart';
import 'package:fluttertraffic/models/VehicleMakeTypeDTO.dart';
import 'package:fluttertraffic/models/VehicleTypeDTO.dart';*/
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

import '../FadeAnimation.dart';
import '../drpdownItem.dart';

class AddYourVehicle extends StatefulWidget{
  String text = "Vehicle Type";
  AddYourVehicle({Key key}) : super(key : key);

  _AddYourVehicle createState() => _AddYourVehicle();

}

class _AddYourVehicle extends State<AddYourVehicle>{

  File imageFile;
  String dropdownValue = 'One';


  GlobalKey actionKey;
  GlobalKey actionKey1;
  double height, width, xPosition, yPosition;

  bool isDropdownOpened = false;
  OverlayEntry floatingDropdown;
  bool isDropdownOpened1 = false;
  OverlayEntry floatingDropdown1;
  TextEditingController vehicleNumberController = new TextEditingController();
  TextEditingController vehicleModelController = new TextEditingController();
  TextEditingController vehicleRCNumberController = new TextEditingController();
  TextEditingController vehicleODOController = new TextEditingController();
  TextEditingController vehicleStateController = new TextEditingController();
  TextEditingController vehicleYearController = new TextEditingController();
  Item selectedType,selectCompany;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    actionKey1 = LabeledGlobalKey("Vehicle Maker");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Add Your Vehicle"),
        /*backgroundColor: Colors.orange[900],*/

      ),
      body: Container(
        decoration: BoxDecoration(
          image:  new DecorationImage(
            image: new ExactAssetImage('assets/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          FadeAnimation(1.3,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
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
                                        controller: vehicleNumberController,
                                        decoration: InputDecoration(
                                            hintText: "Vehicle Number",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            border: InputBorder.none
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          SizedBox(height: 10),
                          FadeAnimation(1.6,
                              Container(
                                width:350 ,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)
                                    )]
                                ),
                                child: DropdownButton<Item>(
                                  hint:  Text("  Vehicle makers"),
                                  value: selectedType,
                                  onChanged: (Item Value) {
                                    setState(() {
                                      selectedType = Value;
                                    });
                                  },
                                  items: users.map((Item user) {
                                    return  DropdownMenuItem<Item>(
                                      value: user,
                                      child: Row(
                                        children: <Widget>[
                                          user.icon,
                                          SizedBox(width: 10,),
                                          Text(
                                            user.name,
                                            style:  TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                          SizedBox(height: 10,),
                          FadeAnimation(1.9,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
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
                                        controller: vehicleModelController,
                                        decoration: InputDecoration(
                                            hintText: "Model",
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
                          FadeAnimation(2.2,
                              Container(
                                width: 350,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)
                                    )]
                                ),
                                child: DropdownButton<Item>(
                                  hint:  Text("  Vehicle makers"),
                                  value: selectCompany,
                                  onChanged: (Item Value) {
                                    setState(() {
                                      selectCompany = Value;
                                    });
                                  },
                                  items: companys.map((Item user) {
                                    return  DropdownMenuItem<Item>(
                                      value: user,
                                      child: Row(
                                        children: <Widget>[
                                          user.icon,
                                          SizedBox(width: 10,),
                                          Text(
                                            user.name,
                                            style:  TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),

                              )
                          ),
                          SizedBox(height: 10,),
                          FadeAnimation(2.5,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
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
                                        controller: vehicleRCNumberController,
                                        decoration: InputDecoration(
                                            hintText: "RCN Number",
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
                          FadeAnimation(2.8,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
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
                                        controller: vehicleODOController,
                                        decoration: InputDecoration(
                                            hintText: "ODO Meter",
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
                          FadeAnimation(3.1,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
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
                                        controller: vehicleStateController,
                                        decoration: InputDecoration(
                                            hintText: "State",
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
                          FadeAnimation(3.4,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
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
                                        controller: vehicleYearController,
                                        decoration: InputDecoration(
                                            hintText: "Year",
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
                          FadeAnimation(3.7,
                              Container(
                                width: 350,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)
                                    )]
                                ),
                                child: InkWell(
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: new Text("Picker"),
                                          content: new Text("Select image picker type."),
                                          actions: <Widget>[
                                            new FlatButton(
                                              child: new Text("Camera"),
                                              onPressed: () {
                                                _getImage(1);
                                                Navigator.pop(context);
                                              },
                                            ),
                                            new FlatButton(
                                              child: new Text("Gallery"),
                                              onPressed: () {
                                                _getImage(2);
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Column(
                                        children: <Widget>[
                                          imageFile != null
                                              ?  Center(child : new Image(image: new FileImage(imageFile),))
                                              : Center(child : new Icon(Icons.add_a_photo,size: 120,color: Colors.black,)),
                                        ]
                                    ),

                                  ),
                                ),
                              )
                          ),
                          SizedBox(height: 10,),
                          FadeAnimation(4,
                            Card(
                              margin: EdgeInsets.all(10.0),
                              color: Colors.cyan,
                              child: InkWell(
                                onTap: (){

                                  VehicleMakeTypeDTO vehicleMakeTypeDto = new VehicleMakeTypeDTO(name: selectedType.toString());
                                  VehicleTypeDTO vehicleTypeDto = new VehicleTypeDTO(name: selectCompany.toString());
                                  VehicleDTO vehicleDto = new VehicleDTO(vehicleTypeId: 2,vehicleMakeType: vehicleMakeTypeDto,vehicleType: vehicleTypeDto,regNumber: vehicleNumberController.text,model: vehicleModelController.text,vehicleMakeId: 1,rCNumber: vehicleRCNumberController.text,oDOMeter: vehicleODOController.text,state: vehicleStateController.text,year: vehicleYearController.text,isActive: true,createdBy: 1);
                                  RestService restService = new RestService();
                                  restService.vehiclePost(vehicleDto).then((data){

                                    if(data != null){

                                      print(data);

                                      /*FlutterToast.showToast(
                                          msg:"Vehicle Added Successfully!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);*/
                                      Toast.show("Vehicle Added Successfull", context, duration: Toast.LENGTH_LONG, gravity:Toast.BOTTOM);

                                    }else{
                                      Toast.show("Vehicle Adding Faild!", context, duration: Toast.LENGTH_LONG, gravity:Toast.BOTTOM);
                                      /*FlutterToast.showToast(
                                          msg:"Vehicle Adding Faild!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);*/

                                    }

                                  }).catchError((onError){
                                    Toast.show("Error", context, duration: Toast.LENGTH_LONG, gravity:Toast.BOTTOM);
                                    /*FlutterToast.showToast(
                                        msg:onError.toString(),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);*/

                                  });

                                },
                                splashColor: Colors.green,
                                child: Center(
                                  heightFactor:2,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text("Submit",style: new TextStyle(fontSize: 17.0,color: Colors.white),),

                                    ],
                                  ),
                                ),

                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _getImage(int type) async {

    var image = await ImagePicker.pickImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50
    );

    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      maxWidth: 600,
      maxHeight: 600,
    );

    /*var compressedFile = await FlutterImageCompress.compressWithFile(
      croppedFile.path,
      croppedFile.path,
      quality: 50,
    );*/

    setState(() {
      imageFile = croppedFile;
    });
  }




}