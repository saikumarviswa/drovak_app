
//import 'package:drovakapp/Vehicle.dart';
import 'package:drovakapp/common/rest.service.dart';
import 'package:drovakapp/models/vehicleDTO.dart';
import 'package:drovakapp/screens/addYourVehicleScreen.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import '../VehicleItem.dart';

class YourVehicles extends StatefulWidget{
  YourVehicles({Key key}) : super(key : key);

  _YourVehicles createState() => _YourVehicles();
}

class _YourVehicles extends State<YourVehicles>{

  List<VehicleDTO> vehList = new List();
  @override
  void initState(){
    super.initState();
    this.getData();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Vehicles"),
      ),
      body: new Scaffold(
        body: new Container(
          width: double.infinity,
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
            child: new CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  sliver: new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                          (context, index) => new VehicleItem(vehList[index]),
                      childCount: vehList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[900],
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new AddYourVehicle()));
        },
        child: Icon(Icons.add,color: Colors.white,size: 50,),
      ),
    );
  }

  void getData(){
    RestService restService = new RestService();
    restService.vehiclesGet().then((data){

      if(data != null){
        this.setState((){
          vehList = data;
        });

        print(vehList.length);
        //FlutterToast.showToast(msg: data.toString());
      }else{
//        FlutterToast.showToast(msg: "Empty");
      }

    });
  }

}