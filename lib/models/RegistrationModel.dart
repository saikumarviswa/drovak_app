


import 'package:drovakapp/common/common.util.dart';

class RegistrationModel{

  String name;
  String mobileNo;
  String gender;
  String emailId;
  String city;
  bool isActive;
  String password;
  int roleId;
  int createdBy;

  RegistrationModel({this.name,
    this.mobileNo,
    this.gender,
    this.emailId,
    this.city,
    this.isActive,
    this.password,
    this.roleId,
    this.createdBy
  });

  factory RegistrationModel.fromJson(Map<String , dynamic> json){
    return RegistrationModel(
      name: json["Name"],
      mobileNo: json["MobileNo"],
      gender: json["Gender"],
      emailId: json["EmailId"],
      city: json["City"],
      isActive: json["IsActive"],
      password: json["Password"],
      roleId: json["RoleId"],
      createdBy: json["CreatedBy"],

    );
  }

  Map<String, dynamic> toJson() =>{
    'Name' : name,
    'MobileNo' : mobileNo,
    'Gender' : gender,
    'EmailId' : emailId,
    'City' : city,
    'IsActive' : isActive,
    'Password' : password,
    'RoleId' : roleId,
    'CreatedBy' : createdBy
  };

  static List<RegistrationModel> parseToList(List<dynamic> dynamicList) {
    if (dynamicList == null) return null;
    List<Map<String, dynamic>> jsonArray =
        CommonUtil.getListOfMaps(dynamicList);
    List<RegistrationModel> ods = new List<RegistrationModel>();
    for (Map<String, dynamic> odjson in jsonArray) {
      ods.add(new RegistrationModel.fromJson(odjson));
    }
    return ods;
  }

  static List<Map<String, dynamic>> parseToMapArray(
      List<RegistrationModel> odts) {
    List<Map<String, dynamic>> odtarry = new List<Map<String, dynamic>>();
    if (odts != null && odts.length > 0) {
      odts.forEach((odt) => {odtarry.add(odt.toJson())});
    }
    return odtarry;
  }
}