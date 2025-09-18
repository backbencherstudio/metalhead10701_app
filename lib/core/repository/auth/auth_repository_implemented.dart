import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metal_head/core/repository/auth/auth_repository.dart';
import '../../services/api_services/api_endpoints.dart';
import '../../services/api_services/api_services.dart';
import '../../services/api_services/shared_preference.dart';

class AuthRepoImplemented implements AuthRepository{
  Future<bool> registerService(String name, String username, String firstName, String lastName, String number, String type, String email, String password) async {
    try{
      final response = await ApiServices.instance.postData(
          body: {
            "username": username,
            "name": name,
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "password": password,
            "phone_number": number,
            "type": type
          },
        endPoint: "${ApiEndPoints.baseUrl}/${ApiEndPoints.register}",
      );
        Fluttertoast.showToast(msg: response["message"]);
        debugPrint("\n\n\n\n$response\n\n\n\n");
        return true;
    }catch(e){
      debugPrint("\n\n\n\n${e.toString()}\n\n\n\n");
      return false;
    }
  }

  // Login
  Future<bool> loginService(String email, String password) async {
    try{
      final response = await ApiServices.instance.postData(
          endPoint: "${ApiEndPoints.baseUrl}/${ApiEndPoints.login}",
          body: {
            "email": email,
            "password": password
          },
      );

      if(response['success'] == true) {
        await SharedPreference().setToken(response['authorization']['token']);
        debugPrint("\n\n\nToken: ${await SharedPreference().getToken()}\n\n\n");
        return true;
      }
    }catch(e){
      return false;
    }
    return false;
  }
}