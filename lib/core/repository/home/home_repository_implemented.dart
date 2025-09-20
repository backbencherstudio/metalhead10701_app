import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:metal_head/core/data/model/job_model.dart';
import 'package:metal_head/core/data/model/user_model.dart';
import '../../services/api_services/api_endpoints.dart';
import '../../services/api_services/api_services.dart';
import 'package:http/http.dart' as http;

  class HomeRepoImplemented {

    // load user
    Future <dynamic> loadUser() async {
      try{
        final response = await ApiServices.instance.getData(
          endPoint: ApiEndPoints.loadUser
        );


        if(response['success'] == true) {
          log(response['data'].toString());
          return UserModel.fromJson(response['data']);
        }
      }catch(e){
        debugPrint("\n\n\n\n${e.toString()}\n\n\n\n");
      }
      return null;
    }

    // post job
    Future<dynamic> postJob({
      required JobModel job,
      required File file,
    }) async {
      try {
        // Prepare fields as strings
        final fields = {
          'title': job.title ?? '',
          'category': job.category ?? '',
          'date_and_time': job.dateAndTime ?? '',
          'price': job.price ?? '',
          'payment_type': job.paymentType ?? '',
          'job_type': job.jobType ?? '',
          'location': job.location ?? '',
          'estimated_time': job.estimatedTime ?? '',
          'description': job.description ?? '',
          'requirements': jsonEncode(job.requirements?.map((e) => e.toJson()).toList() ?? []),
        };

        // Prepare multipart file
        final multipartFile = await http.MultipartFile.fromPath('file', file.path);

        // Call your new multipart post service
        final response = await ApiServices.instance.postMultipartData(
          endPoint: 'api/jobs',
          fields: fields,
          files: [multipartFile],
        );

        if (response['success'] == true) {
          return JobModel.fromJson(response['data']);
        }
      } catch (e) {
        debugPrint("\n\n\n\n${e.toString()}\n\n\n\n");
      }

      return null;
    }

  }