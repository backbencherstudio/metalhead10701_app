import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:metal_head/core/repository/auth/auth_repository.dart';
import '../../services/api_services/api_endpoints.dart';
import '../../services/api_services/api_services.dart';
import '../../services/shared_preference/shared_preference.dart';

class AuthRepoImplemented implements AuthRepository{

  // Register
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
        headers: {
          'Content-Type': 'application/json',
        },
        endPoint: ApiEndPoints.register,
      );
        debugPrint("\n\n\n\n$response\n\n\n\n");
      Fluttertoast.showToast(msg: response['message']);
        if(response['success'] == true) {
          return true;
        } else {
          return false;
        }
    }catch(e){
      debugPrint("\n\n\n\n${e.toString()}\n\n\n\n");
      return false;
    }
  }

  // Verify Mail
  Future<bool> verifyMailService(String otp) async {
    try{
      final response = await ApiServices.instance.postData(
        body: {
          "email": "bihevob488@ekuali.com",
          "token": otp
        },
        headers: {
          'Content-Type': 'application/json',
        },
        endPoint: ApiEndPoints.verifyMail,
      );
      debugPrint("\n\n\n\n$response\n\n\n\n");
      Fluttertoast.showToast(msg: response['message']);
      if(response['success'] == true) {
        return true;
      } else {
        return false;
      }
    }catch(e){
      debugPrint("\n\n\n\n${e.toString()}\n\n\n\n");
      return false;
    }
  }

  // Resend Otp
  Future<bool> resendOtpService(String mail) async {
    try{
      final response = await ApiServices.instance.postData(
        body: {
          "email": mail
        },
        headers: {
          'Content-Type': 'application/json',
        },
        endPoint: ApiEndPoints.resendOtp,
      );
      debugPrint("\n\n\n\n$response\n\n\n\n");
      Fluttertoast.showToast(msg: response['message']);
      if(response['success'] == true) {
        return true;
      } else {
        return false;
      }
    }catch(e){
      debugPrint("\n\n\n\n${e.toString()}\n\n\n\n");
      return false;
    }
  }

  // Login
  Future<bool> loginService(String email, String password) async {
    try{
      final response = await ApiServices.instance.postData(
          endPoint: ApiEndPoints.login,
          body: {
            "email": email,
            "password": password
          },
      );
      debugPrint(response);
      if(response['success'] == true) {
        await SharedPreference().setToken(response['authorization']['token']);
        debugPrint("\n\n\nToken: ${await SharedPreference().getToken()}\n\n\n");
        return true;
      }
    }catch(e){
      return false;
    }
    return true;
  }
}