
import 'package:drovakapp/common/common.util.dart';

class StatusTypeDTO {
  int id;
  String name;
  String description;
  bool isActive;

  StatusTypeDTO({this.id, this.name, this.description, this.isActive});

  factory StatusTypeDTO.fromJson(Map<String, dynamic> json) {
    return new StatusTypeDTO(
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

  static List<StatusTypeDTO> parseToList(List<dynamic> dynamicList) {
    if (dynamicList == null) return null;
    List<Map<String, dynamic>> jsonArray =
        CommonUtil.getListOfMaps(dynamicList);
    List<StatusTypeDTO> ods = new List<StatusTypeDTO>();
    for (Map<String, dynamic> odjson in jsonArray) {
      ods.add(new StatusTypeDTO.fromJson(odjson));
    }
    return ods;
  }

  static List<Map<String, dynamic>> parseToMapArray(List<StatusTypeDTO> odts) {
    List<Map<String, dynamic>> odtarry = new List<Map<String, dynamic>>();
    if (odts != null && odts.length > 0) {
      odts.forEach((odt) => {odtarry.add(odt.toJson())});
    }
    return odtarry;
  }
}
