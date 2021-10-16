import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:follow_app/constant/strings.dart';
import 'package:follow_app/models/actor.dart';
import 'package:follow_app/models/output.dart';
import 'package:follow_app/models/register.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Output> getRegister(String id, String email) async {
    var client = http.Client();
    var outputModel;

    try {
      var response = await client.get(
          Uri.parse(Strings.root_url + Strings.register_url + id + "/" + email),
          headers: {
            "Authorization": "Token 9eb5151b6ddfe3f1d5a18af586c689f323feb6a3"
          });

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        outputModel = Output.fromJson(jsonMap);
      }
      if (response.statusCode == 400) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        outputModel = Output.fromJson(jsonMap);
        print("asdas");
        print(outputModel.toString());
      }
    } catch (Exception) {
      return outputModel;
    }
    return outputModel;
  }

  Future<Output> getVerification(String id, String code) async {
    var client = http.Client();
    var verificationModel;

    try {
      var response = await client.get(
          Uri.parse(
              Strings.root_url + Strings.verification_url + id + "/" + code),
          headers: {
            "Authorization": "Token 9eb5151b6ddfe3f1d5a18af586c689f323feb6a3"
          });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        verificationModel = Output.fromJson(jsonMap);
      }
      if (response.statusCode == 400) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        verificationModel = Output.fromJson(jsonMap);
      }
    } catch (Exception) {
      return verificationModel;
    }
    return verificationModel;
  }

  Future<SingUp> postSignUp(String username, String password) async {
    var client = http.Client();
    var signUpModel;

    try {
      var response = await client.post(
          Uri.parse(Strings.root_url + Strings.signup_url),
          headers: {
            "Authorization": "Token 9eb5151b6ddfe3f1d5a18af586c689f323feb6a3"
          },
          body: jsonEncode(<String, String>{
            'username': username,
            'password': password,
          }));
      print("1");
      print(Uri.parse(Strings.root_url + Strings.signup_url));
      if (response.statusCode == 200) {
        print("2");
        print(response);
        var jsonString = response.body;
        print("3");
        print(jsonString);
        var jsonMap = json.decode(jsonString);
        print("4");
        print(jsonMap);
        signUpModel = SingUp.fromJson(jsonMap);
        print("5");
        print(signUpModel);
      }
      if (response.statusCode == 400) {
        print("6");
        print(response);
        var jsonString = response.body;
        print("7");
        print(jsonString);
        var jsonMap = json.decode(jsonString);
        print("8");
        print(jsonMap);
        signUpModel = SingUp.fromJson(jsonMap);
        print("9");
        print(signUpModel);
      }
    } catch (Exception) {
      print("10");
      print(Exception);
      print("11");
      print(signUpModel.toString());
      return signUpModel;
    }
    print("12");
    print(signUpModel);
    return signUpModel;
  }

  Future<Actor> getLogin(String username, String password) async {
    var client = http.Client();
    var loginModel;

    try {
      var response = await client.post(
          Uri.parse(Strings.root_url + Strings.login_url),
          headers: {
            "Authorization": "Token 9eb5151b6ddfe3f1d5a18af586c689f323feb6a3"
          },
          body: jsonEncode(<String, String>{
            'username': username,
            'password': password,
          }));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        loginModel = Actor.fromJson(jsonMap);
      }

      if (response.statusCode == 400) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        loginModel = Actor.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception);
      print(loginModel.toString());
      return loginModel;
    }

    return loginModel;
  }
}
