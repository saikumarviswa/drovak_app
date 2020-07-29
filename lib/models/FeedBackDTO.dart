
import 'package:drovakapp/common/common.util.dart';

import 'FeedbackTypeDTO.dart';
import 'LogInTypeDTO.dart';
import 'StatusTypeDTO.dart';
import 'VehicleDTO.dart';
import 'VehicleDTO.dart';

class FeedBackDTO {
  int id;
  int feedBackTypeId;
  int regId;
  int vehicleId;
  int loginTypeId;
  DateTime dateOfTransaction;
  String comments;
  bool isPositive;
  String regNumber;
  String lon;
  String lat;
  String location;
  int status;
  bool isActive;
  int createdBy;
  DateTime createdOn;
  int updatedBy;
  DateTime updatedOn;

  FeedbackTypeDTO feedbackType;
  LogInTypeDTO logInType;
  StatusTypeDTO statusType;
  VehicleDTO vehicle;

  FeedBackDTO(
      {this.id,
      this.feedBackTypeId,
      this.regId,
      this.vehicleId,
      this.loginTypeId,
      this.dateOfTransaction,
      this.comments,
      this.isPositive,
      this.regNumber,
      this.lon,
      this.lat,
      this.location,
      this.status,
      this.isActive,
      this.createdBy,
      this.createdOn,
      this.updatedBy,
      this.updatedOn,
      this.feedbackType,
      this.logInType,
      this.statusType,
      this.vehicle});

    factory FeedBackDTO.fromJson(Map<String, dynamic> json) {
    return new FeedBackDTO(
        id: json['Id'],
        feedBackTypeId: json['FeedBackTypeId'],
        regId: json['RegId'],
        vehicleId: json['VehicleId'],
        loginTypeId: json['LoginTypeId'],
        dateOfTransaction: json['DateOfTransaction'],
        comments: json['Comments'],
        isPositive: json['IsPositive'],
        regNumber: json['RegNumber'],
        lon: json['Lon'],
        lat: json['Lat'],
        location: json['Location'],
        status: json['Status'],
        isActive: json['IsActive'],
        createdBy: json['CreatedBy'],
        createdOn: json['CreatedOn'],
        updatedBy: json['UpdatedBy'],
        updatedOn: json['UpdatedOn'],
        feedbackType: json['FeedbackType'] != null
            ? FeedbackTypeDTO.fromJson(json['FeedbackType'])
            : null,
        logInType: json['LogInType'] != null
            ? LogInTypeDTO.fromJson(json['LogInType'])
            : null,
        statusType: json['StatusType'] != null
            ? StatusTypeDTO.fromJson(json['StatusType'])
            : null,
        vehicle: json['Vehicle'] != null
            ? VehicleDTO.fromJson(json['Vehicle'])
            : null);
  }

  Map<String, dynamic> toJson() => {
        'Id': id,
        'FeedBackTypeId': feedBackTypeId,
        'RegId': regId,
        'VehicleId': vehicleId,
        'LoginTypeId': loginTypeId,
        'DateOfTransaction': dateOfTransaction,
        'Comments': comments,
        'IsPositive': isPositive,
        'RegNumber': regNumber,
        'Lon': lon,
        'Lat': lat,
        'Location': location,
        'Status': status,
        'IsActive': isActive,
        'CreatedBy': createdBy,
        'CreatedOn': createdOn,
        'UpdatedBy': updatedBy,
        'UpdatedOn': updatedOn,

        'FeedbackType': feedbackType != null? feedbackType.toJson():null,
        'LogInType': logInType != null? logInType.toJson():null,
        'StatusType': statusType != null ? statusType.toJson():null,
        'Vehicle': vehicle /*!= null ? vehicle.toJson():null*/
      };

  static List<FeedBackDTO> parseToList(List<dynamic> dynamicList) {
    if (dynamicList == null) return null;
    List<Map<String, dynamic>> jsonArray =
        CommonUtil.getListOfMaps(dynamicList);
    List<FeedBackDTO> ods = new List<FeedBackDTO>();
    for (Map<String, dynamic> odjson in jsonArray) {
      ods.add(new FeedBackDTO.fromJson(odjson));
    }
    return ods;
  }

  static List<Map<String, dynamic>> parseToMapArray(List<FeedBackDTO> odts) {
    List<Map<String, dynamic>> odtarry = new List<Map<String, dynamic>>();
    if (odts != null && odts.length > 0) {
      odts.forEach((odt) => {odtarry.add(odt.toJson())});
    }
    return odtarry;
  }

  FeedBackDTO fromJson(Map<String, dynamic> json) {
    return new FeedBackDTO(
        id: json['Id'],
        feedBackTypeId: json['FeedBackTypeId'],
        regId: json['RegId'],
        vehicleId: json['VehicleId'],
        loginTypeId: json['LoginTypeId'],
        dateOfTransaction: json['DateOfTransaction'],
        comments: json['Comments'],
        isPositive: json['IsPositive'],
        regNumber: json['RegNumber'],
        lon: json['Lon'],
        lat: json['Lat'],
        location: json['Location'],
        status: json['Status'],
        isActive: json['IsActive'],
        createdBy: json['CreatedBy'],
        createdOn: json['CreatedOn'],
        updatedBy: json['UpdatedBy'],
        updatedOn: json['UpdatedOn'],
        feedbackType: json['FeedbackType'] != null
            ? FeedbackTypeDTO.fromJson(json['FeedbackType'])
            : null,
        logInType: json['LogInType'] != null
            ? LogInTypeDTO.fromJson(json['LogInType'])
            : null,
        statusType: json['StatusType'] != null
            ? StatusTypeDTO.fromJson(json['StatusType'])
            : null,
        vehicle: json['Vehicle'] != null
            ? VehicleDTO.fromJson(json['Vehicle'])
            : null);
  }




}
