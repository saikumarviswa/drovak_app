import 'package:drovakapp/common/common.util.dart';

import 'RoleDTO.dart';

class UserDTO{
  int id;
  int roleId;
  String name;
  String password;
  String mobileNo;
  String emailId;
  bool isActive;
  int createdBy;
  String createdOn;
  int updatedBy;
  String updatedOn;
  RoleDTO role;

  UserDTO({this.id,
    this.roleId,
    this.name,
    this.password,
    this.mobileNo,
    this.emailId,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.role
  });

  factory UserDTO.fromJson(Map<String ,dynamic> json){

    return UserDTO(
        id: json["Id"],
        roleId: json["RoleId"],
        name: json["Name"],
        password: json["Password"],
        mobileNo: json["MobileNo"],
        emailId: json["EmailId"],
        isActive: json["IsActive"],
        createdBy: json["CreatedBy"],
        createdOn: json["CreatedOn"],
        updatedBy: json["UpdatedBy"],
        updatedOn: json["UpdatedOn"],
        role: json["Role"]!=null? RoleDTO.fromJson(json["Role"]):null
    );
  }

  Map<String, dynamic> toJson() =>{
    'Id' : id,
    'RoleId' : roleId,
    'Name' : name,
    'Password' : password,
    'MobileNo' : mobileNo,
    'EmailId' : emailId,
    'IsActive' : isActive,
    'CreatedBy' : createdBy,
    'CreatedOn' : createdOn,
    'UpdatedBy' : updatedBy,
    'UpdatedOn' : updatedOn,
    'Role' : role!=null?role.toJson():null
  };

  static List<UserDTO> parseToList(List<dynamic> dynamicList) {
    if (dynamicList == null) return null;
    List<Map<String, dynamic>> jsonArray =
    CommonUtil.getListOfMaps(dynamicList);
    List<UserDTO> ods = new List<UserDTO>();
    for (Map<String, dynamic> odjson in jsonArray) {
      ods.add(new UserDTO.fromJson(odjson));
    }
    return ods;
  }

  static List<Map<String, dynamic>> parseToMapArray(
      List<UserDTO> odts) {
    List<Map<String, dynamic>> odtarry = new List<Map<String, dynamic>>();
    if (odts != null && odts.length > 0) {
      odts.forEach((odt) => {odtarry.add(odt.toJson())});
    }
    return odtarry;
  }
}