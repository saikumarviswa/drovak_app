import 'package:drovakapp/common/request.body.dart';
import 'package:drovakapp/models/FeedBackDTO.dart';
import 'package:drovakapp/models/RegistrationModel.dart';
import 'package:drovakapp/models/uploadImageDTO.dart';
import 'package:drovakapp/models/userDTO.dart';
import 'package:drovakapp/models/vehicleDTO.dart';
import 'http.service.dart';

class RestService{
  HttpService httpService = new HttpService();
  // DatabaseService dbSvc = DatabaseService();

  Future<UserDTO> getUser(String userName, String password) async {
    RequestBody reqBody = new RequestBody();
    reqBody.url = "auth/user/get/$userName/$password";
    reqBody.type = "GET";
    Map<String, dynamic> loginData = {
      'MobileNo': userName,
      'Password': password
    };
    reqBody.reqData = loginData;
    final response = await httpService.restService(reqBody);
    return new UserDTO.fromJson(response.data["ResultData"]);
  }

  Future<bool> registerUser(RegistrationModel registrationModel) async {
    RequestBody reqBody = new RequestBody();
    reqBody.url = "reg/save/user";
    reqBody.type = 'POST';
    reqBody.reqData = registrationModel.toJson();
    final response = await httpService.restService(reqBody);
    bool res  = response.data['Status'];
    return res;
  }

  Future<bool> vehiclePost(VehicleDTO vehicleDTO) async {
    RequestBody requestBody = new RequestBody();
    requestBody.url = "vehicle/save/vehicle";
    requestBody.type = 'POST';
    requestBody.reqData = vehicleDTO.toJson();
    final response = await httpService.restService(requestBody);
    bool resp = response.data['Status'];
    return resp;
  }

  Future<List<VehicleDTO>> vehiclesGet() async {
    RequestBody requestBody = new RequestBody();
    requestBody.url = "vehicle/get/vehicles";
    requestBody.type = "GET";
    final response = await httpService.restService(requestBody);
    print("############################# ${response}");
    // var data = jsonDecode(response.data["ResultData"])['ResultData'] as List;
    //print(data);

    List<VehicleDTO> list = new List<VehicleDTO>();
    for(var data in response.data["ResultData"] ){
      list.add(new VehicleDTO.fromJson(data));
    }
    print(list.length);

    return list;
  }

  Future<List<FeedBackDTO>> complaintsGet() async {
    RequestBody requestBody = new RequestBody();
    requestBody.url = "setting/get/feedbacktype";
    requestBody.type = "GET";
    final response = await httpService.restService(requestBody);
    print("############################# ${response}");
    // var data = jsonDecode(response.data["ResultData"])['ResultData'] as List;
    //print(data);

    List<FeedBackDTO> list = new List<FeedBackDTO>();
    for(var data in response.data["ResultData"] ){
      list.add(new FeedBackDTO().fromJson(data));
    }
    print(list.length);

    return list;
  }

  Future<bool> complaintPost(FeedBackDTO feedBackDTO) async {
    RequestBody requestBody = new RequestBody();
    requestBody.url = "vehicle/save/vehicle/feedback";
    requestBody.type = 'POST';
    requestBody.reqData = feedBackDTO.toJson();

    final response = await httpService.restService(requestBody);
    bool resp = response.data['Status'];
    print("!!!!!!!!!!!!!!!!!!!!!!!!! ${resp}");
    return resp;
  }

  Future<bool> uploadImage(UploadImageDTO uploadImageDTO) async {
    RequestBody requestBody = new RequestBody();
    requestBody.url = "vehicle/upload/image";
    requestBody.type = 'POST';
    requestBody.reqData = uploadImageDTO.toJson();

    final response = await httpService.restService(requestBody);
    bool resp = response.data['Status'];
    print("!!!!!!!!!!!!!!!!!!!!!!!!! ${resp}");
    return resp;
  }



 /* Future<UserDTO> getUser(String userName, String password) async {
    RequestBody reqBody = new RequestBody();
    reqBody.url = "auth/user/get/$userName/$password";
    reqBody.type = "GET";
    Map<String, dynamic> loginData = {
      'MobileNo': userName,
      'Password': password
    };
    reqBody.reqData = loginData;
    final response = await httpService.restService(reqBody);
    return new UserDTO.fromJson(response.data["ResultData"]);
  }

  Future<bool> registerUser(RegistrationModel registrationModel) async {
    RequestBody reqBody = new RequestBody();
    reqBody.url = "reg/save/user";
    reqBody.type = 'POST';
    reqBody.reqData = registrationModel.toJson();
    final response = await httpService.restService(reqBody);
    bool res  = response.data['Status'];
    return res;
  }

  Future<bool> vehiclePost(VehicleDTO vehicleDTO) async {
    RequestBody requestBody = new RequestBody();
    requestBody.url = "vehicle/save/vehicle";
    requestBody.type = 'POST';
    requestBody.reqData = vehicleDTO.toJson();
    final response = await httpService.restService(requestBody);
    bool resp = response.data['Status'];
    return resp;
  }

  Future<List<VehicleDTO>> vehiclesGet() async {
    RequestBody requestBody = new RequestBody();
    requestBody.url = "vehicle/get/vehicles";
    requestBody.type = "GET";
    final response = await httpService.restService(requestBody);
    print("############################# ${response}");
   // var data = jsonDecode(response.data["ResultData"])['ResultData'] as List;
    //print(data);

    List<VehicleDTO> list = new List<VehicleDTO>();
    for(var data in response.data["ResultData"] ){
      list.add(new VehicleDTO.fromJson(data));
    }
    print(list.length);

    return list;
  }
*/
}