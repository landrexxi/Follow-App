import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:follow_app/constant/strings.dart';
import 'package:follow_app/models/output.dart';
import 'package:follow_app/models/register.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Output> getOutput(String id, String email) async {
    var client = http.Client();
    var outputModel;

    try {
      var response = await client.get(Uri.parse(
          Strings.root_url + Strings.signupfirst_url + id + "/" + email));
      print(Uri.parse(
          Strings.root_url + Strings.signupfirst_url + id + "/" + email));
      print("chuchu");
      print(id + email);
      if (response.statusCode == 200) {
        print("suloooddddddddd");
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        outputModel = Output.fromJson(jsonMap);
        print(outputModel);
      }
    } catch (Exception) {
      print("blabla");
      print(Exception);
      print(outputModel);
      return outputModel;
    }

    return outputModel;
  }

  Future<Output> getVerification(String id, String code) async {
    var client = http.Client();
    var verificationModel;

    try {
      var response = await client.get(Uri.parse(
          Strings.root_url + Strings.verification_url + id + "/" + code));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        verificationModel = Output.fromJson(jsonMap);
      }
    } catch (Exception) {
      return verificationModel;
    }

    return verificationModel;
  }

  Future<Register> getRegister() async {
    var client = http.Client();
    var registerModel;

    try {
      var response = await client
          .get(Uri.parse(Strings.root_url + Strings.registerAcc_url));
      print(Uri.parse(Strings.root_url + Strings.registerAcc_url));
      print("GAwas URL");
      if (response.statusCode == 200) {
        print(response);
        print("responseeeee");
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        print(jsonMap);
        print("Jseeeeeeeeeen");
        registerModel = Register.fromJson(jsonMap);
        print(registerModel);
        print("registeeeeeeeeeer");
      }
    } catch (Exception) {
      print("Except");
      print(Exception);
      print(registerModel);
      return registerModel;
    }
    print(registerModel);
    print("Rawwwwr");
    return registerModel;
  }
}
