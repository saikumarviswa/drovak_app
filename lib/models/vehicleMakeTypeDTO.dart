import 'package:drovakapp/common/common.util.dart';

class VehicleMakeTypeDTO{
  int id;
  String name;
  int noOfWheels;
  String description;
  bool isActive;

  VehicleMakeTypeDTO({this.id,
    this.name,
    this.noOfWheels,
    this.description,
    this.isActive
  });

  factory VehicleMakeTypeDTO.fromJson(Map<String , dynamic> json){
    return VehicleMakeTypeDTO(
        id: json["Id"],
        name: json["Name"],
        noOfWheels: json["NoOfWheels"],
        description: json["Description"],
        isActive: json["IsActive"]

    );
  }

  Map<String,dynamic> toJson() => {
    'Id' : id,
    'Name' : name,
    'NoOfWheels' : noOfWheels,
    'Description' : description,
    'IsActive' : isActive
  };

  static List<VehicleMakeTypeDTO> parseToList(List<dynamic> dynamicList) {
    if (dynamicList == null) return null;
    List<Map<String, dynamic>> jsonArray =
    CommonUtil.getListOfMaps(dynamicList);
    List<VehicleMakeTypeDTO> ods = new List<VehicleMakeTypeDTO>();
    for (Map<String, dynamic> odjson in jsonArray) {
      ods.add(new VehicleMakeTypeDTO.fromJson(odjson));
    }
    return ods;
  }

  static List<Map<String, dynamic>> parseToMapArray(List<VehicleMakeTypeDTO> odts) {
    List<Map<String, dynamic>> odtarry = new List<Map<String, dynamic>>();
    if (odts != null && odts.length > 0) {
      odts.forEach((odt) => {odtarry.add(odt.toJson())});
    }
    return odtarry;
  }
}