import 'package:drovakapp/common/common.util.dart';

class RegistrationDTO {
  int id;
  String name;
  String mobileNo;
  String gender;
  String emailId;
  String city;
  DateTime registeredOn;
  bool isActive;
  int createdBy;
  DateTime createdOn;
  int updatedBy;
  DateTime updatedOn;

  RegistrationDTO(
      {this.id,
        this.name,
        this.mobileNo,
        this.gender,
        this.emailId,
        this.city,
        this.registeredOn,
        this.isActive,
        this.createdBy,
        this.createdOn,
        this.updatedBy,
        this.updatedOn});

  factory RegistrationDTO.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return RegistrationDTO(
      id: json["Id"],
      name: json["Name"],
      mobileNo: json["MobileNo"],
      gender: json["Gender"],
      emailId: json["EmailId"],
      city: json["City"],
      registeredOn: json["RegisteredOn"],
      isActive: json["IsActive"],
      createdBy: json["CreatedBy"],
      createdOn: json["CreatedOn"],
      updatedBy: json["UpdatedBy"],
      updatedOn: json["UpdatedOn"],
    );
  }

  Map<String, dynamic> toJson() => {
    'Id': id,
    'Name': name,
    'MobileNo': mobileNo,
    'Gender': gender,
    'EmailId': emailId,
    'City': city,
    'RegisteredOn': registeredOn,
    'IsActive': isActive,
    'CreatedBy': createdBy,
    'CreatedOn': createdOn,
    'UpdatedBy': updatedBy,
    'UpdatedOn': updatedOn
  };

  static List<RegistrationDTO> parseToList(List<dynamic> dynamicList) {
    if (dynamicList == null) return null;
    List<Map<String, dynamic>> jsonArray =
    CommonUtil.getListOfMaps(dynamicList);
    List<RegistrationDTO> ods = new List<RegistrationDTO>();
    for (Map<String, dynamic> odjson in jsonArray) {
      ods.add(new RegistrationDTO.fromJson(odjson));
    }
    return ods;
  }

  static List<Map<String, dynamic>> parseToMapArray(
      List<RegistrationDTO> odts) {
    List<Map<String, dynamic>> odtarry = new List<Map<String, dynamic>>();
    if (odts != null && odts.length > 0) {
      odts.forEach((odt) => {odtarry.add(odt.toJson())});
    }
    return odtarry;
  }
}
