
import 'package:drovakapp/notif.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget{

  final Notific notific;

  NotificationItem(this.notific);

  @override
  Widget build(BuildContext context) {
    return  Card(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage("assets/ktm_rc.jpg"),
                        fit: BoxFit.cover,
                      ),
                      //borderRadius: BorderRadius.circular(80.0),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),

                  ),
              ),
              SizedBox(height: 7,),
              Container(
                alignment: Alignment.centerLeft,
                  child: Text(notific.description,style: TextStyle(color: Colors.grey[400],fontSize: 15,fontWeight: FontWeight.w400),),
              ),
            ],
          ),
        ),
    );
  }

}