import 'package:drovakapp/common/common.util.dart';

class RoleDTO {
  int id;
  String name;
  String description;
  bool isActive;

  RoleDTO({this.id, this.name, this.description, this.isActive});

  factory RoleDTO.fromJson(Map<String, dynamic> json) {
    return new RoleDTO(
        id: json["Id"],
        name: json["Name"],
        description: json["Description"],
        isActive: json["IsActive"]);
  }

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Description': description,
        'IsActive': isActive
      };

  static List<RoleDTO> parseToList(List<dynamic> dynamicList) {
    if (dynamicList == null) return null;
    List<Map<String, dynamic>> jsonArray =
        CommonUtil.getListOfMaps(dynamicList);
    List<RoleDTO> ods = new List<RoleDTO>();
    for (Map<String, dynamic> odjson in jsonArray) {
      ods.add(new RoleDTO.fromJson(odjson));
    }
    return ods;
  }

  static List<Map<String, dynamic>> parseToMapArray(List<RoleDTO> odts) {
    List<Map<String, dynamic>> odtarry = new List<Map<String, dynamic>>();
    if (odts != null && odts.length > 0) {
      odts.forEach((odt) => {odtarry.add(odt.toJson())});
    }
    return odtarry;
  }
}
