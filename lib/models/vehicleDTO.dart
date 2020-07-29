
import 'package:drovakapp/common/common.util.dart';
import 'package:drovakapp/models/regestrationDTO.dart';
import 'package:drovakapp/models/vehicleMakeTypeDTO.dart';
import 'package:drovakapp/models/vehicleTypeDTO.dart';



class VehicleDTO {
  int id;
  int vehicleTypeId;
  int regId;
  String regNumber;
  String model;
  int vehicleMakeId;
  String rCNumber;
  String oDOMeter;
  String state;
  String year;
  bool isActive;
  int createdBy;
  String createdOn;
  int updatedBy;
  String updatedOn;
  RegistrationDTO registration;
  VehicleMakeTypeDTO vehicleMakeType;
  VehicleTypeDTO vehicleType;

  VehicleDTO(
      {this.id,
        this.vehicleMakeId,
        this.regId,
        this.regNumber,
        this.model,
        this.vehicleTypeId,
        this.rCNumber,
        this.oDOMeter,
        this.state,
        this.year,
        this.isActive,
        this.createdBy,
        this.createdOn,
        this.updatedBy,
        this.updatedOn,
        this.registration,
        this.vehicleMakeType,
        this.vehicleType});

  factory VehicleDTO.fromJson(Map<String, dynamic> json) {
    return VehicleDTO(
        id: json["Id"],
        vehicleMakeId: json["VehicleMakeId"],
        regId: json["RegId"],
        regNumber: json["RegNumber"],
        model: json["Model"],
        vehicleTypeId: json["VehicleTypeId"],
        rCNumber: json["RCNumber"],
        oDOMeter: json["ODOMeter"],
        state: json["State"],
        year: json["Year"],
        isActive: json["IsActive"],
        createdBy: json["CreatedBy"],
        createdOn: json["CreatedOn"],
        updatedBy: json["UpdatedBy"],
        updatedOn: json["UpdatedOn"],

        registration: json["RegistrationDTO"] != null? RegistrationDTO.fromJson(json["RegistrationDTO"]):null,
        vehicleMakeType: json["VehicleMakeType"] != null? VehicleMakeTypeDTO.fromJson(json["VehicleMakeType"]):null,
        vehicleType: json["VehicleType"]!= null? VehicleTypeDTO.fromJson(json["VehicleType"]):null
    );
  }

  Map<String, dynamic> toJson() => {
    'Id': id,
    'VehicleMakeId': vehicleMakeId,
    'RegId': regId,
    'RegNumber': regNumber,
    'Model': model,
    'VehicleTypeId': vehicleTypeId,
    'RCNumber': rCNumber,
    'ODOMeter': oDOMeter,
    'State': state,
    'Year': year,
    'IsActive': isActive,
    'CreatedBy': createdBy,
    'CreatedOn': createdOn,
    'UpdatedBy': updatedBy,
    'UpdatedOn': updatedOn,
    'RegistrationDTO': registration != null? registration.toJson():null,
    'VehicleMakeType': vehicleMakeType != null? vehicleMakeType.toString():null,
    'VehicleType': vehicleType != null? vehicleType.toJson():null
  };

  static List<VehicleDTO> parseToList(List<dynamic> dynamicList) {
    if (dynamicList == null) return null;
    List<Map<String, dynamic>> jsonArray =
    CommonUtil.getListOfMaps(dynamicList);
    List<VehicleDTO> ods = new List<VehicleDTO>();
    for (Map<String, dynamic> odjson in jsonArray) {
      ods.add(new VehicleDTO.fromJson(odjson));
    }
    return ods;
  }

  static List<Map<String, dynamic>> parseToMapArray(List<VehicleDTO> odts) {
    List<Map<String, dynamic>> odtarry = new List<Map<String, dynamic>>();
    if (odts != null && odts.length > 0) {
      odts.forEach((odt) => {odtarry.add(odt.toJson())});
    }
    return odtarry;
  }
}
