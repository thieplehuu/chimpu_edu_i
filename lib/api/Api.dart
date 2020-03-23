
import 'dart:convert';

import 'package:chimpu_edu_i/data/model/response.dart';
import 'package:http/http.dart' as http;
import 'package:chimpu_edu_i/utils/constants.dart' as Constants;
class API{
  
  static Future<Response> userLogin(String username, String password, int accountType) async {
    var url = Constants.SERVER_API +'/user/login';
    try { 
      var response = await http.post(url, 
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password, 'type': accountType})
      );
      return Response.fromJson(json.decode(response.body));
    } catch (e) {
      print(e);
      return Response(
        code: 404,
        message: "strings_cannot_load_page",
        data: null,
      );
    }    
  }

  static Future<Response> getAuth(String token) async {
    var url = Constants.SERVER_API +'/user/auth';
    try { 
      var response = await http.post(url, 
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      return Response.fromJson(json.decode(response.body));
    } catch (e) {
      print(e);
      return Response(
        code: 404,
        message: "strings_cannot_load_page",
        data: null,
      );
    }
  }

  static Future<Response> getStudents(String token) async {
    var url = Constants.SERVER_API +'/classroom/users';
    try { 
      var response = await http.post(url, 
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'classroom_id': 1})
      );
      return Response.fromJson(json.decode(response.body));
    } catch (e) {
      print(e);
      return Response(
        code: 404,
        message: "strings_cannot_load_page",
        data: null,
      );
    }    
  }

  static Future<Response> getStudentsTimesheet(String token) async {
    var url = Constants.SERVER_API +'/classroom/timesheet';
    var now = new DateTime.now();
    var year = now.year;
    var month = now.month;
    var day = now.day;
    try { 
      var response = await http.post(url, 
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'classroom_id': 1, 'year': year, 'month': month, 'day': day})
      );
      return Response.fromJson(json.decode(response.body));
    } catch (e) {
      print(e);
      return Response(
        code: 404,
        message: "strings_cannot_load_page",
        data: null,
      );
    }    
  }
}