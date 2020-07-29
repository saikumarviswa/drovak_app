import 'dart:io';

import 'package:drovakapp/models/internal/popupmenumodel.dart';
import 'package:flutter/material.dart';

class CommonUtil{
   static List<Map<String, dynamic>> getListOfMaps(List<dynamic> dynamicList) {
    return dynamicList
        .cast<Map<String, dynamic>>()
        .map((trace) => trace.cast<String, dynamic>())
        .toList();
  }
    static String formatDateToDisplay(DateTime date) {    
    String formattedDate = "${date.day}-${date.month}-${date.year}";
    return formattedDate;
  }
  static String formatTimeToDisplay(DateTime date) {    
    String formattedDate = "${appendZero(date.hour)}:${appendZero(date.minute)}:${appendZero(date.second)}";
    return formattedDate;
  }
  static String appendZero(int number){
  String formated = number.toString();
  if(formated.length == 1)
    if(number >=0 && number <= 9)  
      formated = "0$number";
  return formated;
}

static String getMonthName(DateTime date){
  String monthName = "";
  switch(date.month){
    case 1:
      monthName = "Jan";
      break;
    case 2:
      monthName = "Feb";
      break;
    case 3:
      monthName = "Mar";
      break;
    case 4:
      monthName = "Apr";
      break;
    case 5:
      monthName = "May";
      break;
    case 6:
      monthName = "Jun";
      break;
    case 7:
      monthName = "Jul";
      break;
    case 8:
      monthName = "Aug";
      break;
    case 9:
      monthName = "Sep";
      break;
    case 10:
      monthName = "Oct";
      break;
    case 11:
      monthName = "Nov";
      break;
    case 12:
      monthName = "Dec";
      break;            
  }      
  return monthName;
}

static String formatDateForAPI(DateTime date) {
    String day = date.day.toString();
    String month = date.month.toString();
    String year = date.year.toString();
    String formattedDate = "$year-$month-$day";
    return formattedDate;
  }
  static String formatDateTimeToDisplay(DateTime date) {  
  String formatedDate = formatDateToDisplay(date);
  String formatedTime = formatTimeToDisplay(date);

  String formattedDateTime = "$formatedDate $formatedTime";
  return formattedDateTime;
}

  static Future<void> showAlertDialog(BuildContext context, bool barrierDismissible,
      String headerText, String bodyText, String actionText) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(headerText),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(bodyText),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

   static List<PopupMenuModel> getSalesPopupMenu() {
    List<PopupMenuModel> menu = List<PopupMenuModel>();
    menu.add(PopupMenuModel(
        key: "CLEARORDER", title: "Clear order", icon: Icons.clear_all));
    return menu;
  }

  static List<PopupMenuModel> getCategoryShowTypes( bool isGrid) {
    List<PopupMenuModel> menu = List<PopupMenuModel>();
    if(isGrid){
      menu.add(PopupMenuModel(
        key: "Showlist", title: "Show List", icon: Icons.format_list_bulleted));
    }else{
      menu.add(PopupMenuModel(
        key: "ShowGrid", title: "Show Grid", icon: Icons.table_chart));

    }

    
    return menu;
  }


  static Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      print(result);
      if (result != null &&
          result[0].rawAddress.isNotEmpty &&
          result[0].rawAddress.isNotEmpty) {
        return true;
      }
      else{
        return false;
      }
    } on SocketException catch (_) {      
      return false;
    }
  }


}