import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:metal_head/core/services/shared_preference/shared_preference.dart';
import '../../utils/utils.dart';
import 'api_endpoints.dart';

class ApiServices {
  /// Singleton instance
  static final ApiServices instance = ApiServices._internal();
  ApiServices._internal();

  /// Helper method to handle the response

  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}, ${response.body}');
    }
  }

  /// multipart post request service
  Future<dynamic> postMultipartData({
    required String endPoint,
    required Map<String, String> fields,
    List<http.MultipartFile>? files,
    Map<String, String>? headers,
  }) async {
    try {
      final isOnline = await Utils.isOnline();
      if (!isOnline) {
        Utils.showErrorToast(
          message: "Device is Offline, Please connect to internet.",
        );
        throw Exception('Device is Offline, Please connect to internet.');
      }

      var uri = Uri.parse('${ApiEndPoints.baseUrl}/$endPoint');
      var request = http.MultipartRequest('POST', uri);

      request.headers.addAll(headers ?? {
        'Authorization': 'Bearer ${await SharedPreference().getToken()}',
        // Do NOT include 'Content-Type' here; MultipartRequest handles it
      });

      // Add text fields
      request.fields.addAll(fields);

      // Add file fields if present
      if (files != null && files.isNotEmpty) {
        request.files.addAll(files);
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }

  /// http Post request service
  Future<dynamic> postData({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      final isOnline = await Utils.isOnline();
      if (isOnline) {
        final response = await http.post(
          Uri.parse('${ApiEndPoints.baseUrl}/$endPoint'),
          headers: headers ?? {
            'Authorization': 'Bearer ${await SharedPreference().getToken()}',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body),
        );
        return _handleResponse(response);
      } else {
        Utils.showErrorToast(
          message: "Device is Offline, Please connect to internet.",
        );
        throw Exception('Device is Offline, Please connect to internet.');
      }
    } catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }

  /// http get request service
  Future<dynamic> getData({
    required String endPoint,
    Map<String, String>? headers,
  }) async {
    try {
      final isOnline = await Utils.isOnline();
      if(isOnline) {
        final response = await http.get(
          Uri.parse('${ApiEndPoints.baseUrl}/$endPoint'),
          headers: headers ?? {
            'Authorization': 'Bearer ${await SharedPreference().getToken()}',
            'Content-Type': 'application/json',
          },
        );
        return _handleResponse(response);
      }
      else {
        Utils.showErrorToast(
          message: "Device is Offline, Please connect to internet.",
        );
        throw Exception('Device is Offline, Please connect to internet.');
      }
    } catch (e) {
      throw Exception("Failed to get data: $e");
    }
  }

  /// http Put request service
  Future<dynamic> putData({
    required String endPoint,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    try {
      final response = await http.put(
        Uri.parse('${ApiEndPoints.baseUrl}/$endPoint'),
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }
}
