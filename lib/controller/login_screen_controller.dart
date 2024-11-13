import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:free_api_sample_ui_main/model/login_res_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController with ChangeNotifier {
  bool isLoading = false;

  Future<bool> onLogin({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    // url setup
    final url = Uri.parse("https://freeapi.luminartechnohub.com/login");

    isLoading = true;
    notifyListeners();

    try {
      // call http method
      final response = await http.post(url, body: {
        "email": email,
        "password": password,
      });

      // check status code
      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        log(response.body.toString());
        // convert data
        LoginResModel loginModel = loginResModelFromJson(response.body);

        //check whether access token is available or not
        if (loginModel.access != null && loginModel.access!.isNotEmpty) {
          log(loginModel.access.toString());
          // shared prefs object to store access and refresh
          SharedPreferences prefs = await SharedPreferences.getInstance();

          //storing access token
          await prefs.setString("access", loginModel.access.toString());
          log(prefs.getString("access").toString());

          //storing refresh token
          await prefs.setString("refresh", loginModel.refresh.toString());
        }
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        var decodedData = jsonDecode(response.body);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(decodedData["detail"])));
      }
    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
    return false;
  }
}
