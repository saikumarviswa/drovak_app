

import 'package:drovakapp/common/common.util.dart';

class UploadImageDTO{

  int userId;
  String vehicleId;
  String regid;
  int feedbackId;
  String image;

  UploadImageDTO({this.userId,this.vehicleId,this.regid,this.feedbackId,this.image});

  factory UploadImageDTO.fromJson(Map<String,dynamic> json){
    return UploadImageDTO(
      userId: json["userId"],
      vehicleId: json["vehicleId"],
      regid: json["regid"],
      feedbackId: json["feedbackId"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'vehicleId': vehicleId,
    'regid': regid,
    'feedbackId': feedbackId,
    'image' : image
  };
  static List<UploadImageDTO> parseToList(List<dynamic> dynamicList) {
    if (dynamicList == null) return null;
    List<Map<String, dynamic>> jsonArray =
    CommonUtil.getListOfMaps(dynamicList);
    List<UploadImageDTO> ods = new List<UploadImageDTO>();
    for (Map<String, dynamic> odjson in jsonArray) {
      ods.add(new UploadImageDTO().fromJson(odjson));
    }
    return ods;
  }

  static List<Map<String, dynamic>> parseToMapArray(List<UploadImageDTO> odts) {
    List<Map<String, dynamic>> odtarry = new List<Map<String, dynamic>>();
    if (odts != null && odts.length > 0) {
      odts.forEach((odt) => {odtarry.add(odt.toJson())});
    }
    return odtarry;
  }

  UploadImageDTO fromJson(Map<String, dynamic> json) {
    return UploadImageDTO(
      userId: json["userId"],
      vehicleId: json["vehicleId"],
      regid: json["regid"],
      feedbackId: json["feedbackId"],
      image: json["image"],
    );
  }


}