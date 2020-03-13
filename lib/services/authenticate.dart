import 'dart:async';

import 'package:chimpu_edu_i/api/Api.dart';
import 'package:chimpu_edu_i/data/model/response.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chimpu_edu_i/utils/constants.dart' as Constants;
class AuthenticateService {
  Future<Response> authenticate({
    @required String username,
    @required String password,
    @required int accountType
  }) async {

    var response = await API.userLogin(username, password, accountType);
    if(response != null && response.code == 200){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(Constants.TOKEN, response.token);
    }
    return response;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if(token == null || token.isEmpty)
      return false;
    return true;
  }
}