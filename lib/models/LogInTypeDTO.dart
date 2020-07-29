
import 'package:drovakapp/common/common.util.dart';

class LogInTypeDTO {
  int id;
  String name;
  String description;
  bool isActive;

  LogInTypeDTO({this.id, this.name, this.description, this.isActive});

  factory LogInTypeDTO.fromJson(Map<String, dynamic> json) {
    return new LogInTypeDTO(
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
  static List<LogInTypeDTO> parseToList(List<dynamic> dynamicList) {
    if (dynamicList == null) return null;
    List<Map<String, dynamic>> jsonArray =
        CommonUtil.getListOfMaps(dynamicList);
    List<LogInTypeDTO> ods = new List<LogInTypeDTO>();
    for (Map<String, dynamic> odjson in jsonArray) {
      ods.add(new LogInTypeDTO.fromJson(odjson));
    }
    return ods;
  }

  static List<Map<String, dynamic>> parseToMapArray(List<LogInTypeDTO> odts) {
    List<Map<String, dynamic>> odtarry = new List<Map<String, dynamic>>();
    if (odts != null && odts.length > 0) {
      odts.forEach((odt) => {odtarry.add(odt.toJson())});
    }
    return odtarry;
  }
}
