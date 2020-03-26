import 'dart:async';

import 'package:chimpu_edu_i/api/Api.dart';
import 'package:chimpu_edu_i/data/model/response.dart';
import 'package:chimpu_edu_i/data/model/user.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chimpu_edu_i/utils/constants.dart' as Constants;
class MainService {
  Future<Response> authenticate({
    @required String username,
    @required String password,
    @required int accountType
  }) async {

    return await API.userLogin(username, password, accountType);
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(Constants.TOKEN);
    return;
  }

  Future<void> persistToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.TOKEN, token);
    return;
  }

  Future<String> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(Constants.TOKEN);
    return token;
  }

  Future<User> getAuth() async {
    var token = await getAccessToken();
    var response = await API.getAuth(token);
    User user = userFromJson(response.data);
    return user;
  }

  Future<List<User>> getStudents() async {
    String token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString(Constants.TOKEN);
    var response = await API.getStudents(token);
     List<User> list = new List();
    if(response != null && response.code == 200){
     
      for (int i = 0; i < response.data.length; i++) {
        User user = userFromJson(response.data[i]);
        list.add(user);
      }
      return list;
    }
    return list;
  }

  Future<List<User>> getStudentsTimesheet() async {
    String token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString(Constants.TOKEN);
    var response = await API.getStudentsTimesheet(token);
    List<User> list = new List();
    if(response != null && response.code == 200){
     
      for (int i = 0; i < response.data.length; i++) {
        User user = userFromJson(response.data[i]);
        list.add(user);
      }
      return list;
    }
    return list;
  }
}