

import 'package:flutter/material.dart';
import 'package:free_api_sample_ui_main/model/product_res_model.dart';
import 'package:free_api_sample_ui_main/utils/app_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController with ChangeNotifier {
  //varial=ble to store products list get from server

  List<ProductModel> productsList = [];

  Future<void> getProducts() async {
    //shared preference  onj
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get stored token
    String storedtoken = prefs.getString("access") ?? "";
    //setup url

    final url = Uri.parse("https://freeapi.luminartechnohub.com/products-all/");
    try {
      //call api
      final response = await http.get(url, headers: {
        "Authorization": "Bearer ${await AppUtils.getStoredAccessToken()}"
      });

      
      //check status code
      if (response.statusCode == 200) {
//convert data to model
        ProductResModel resModel = productResModelFromJson(response.body);

        //store data to variable
        productsList = resModel.data ?? [];
      }
    } catch (e) {}
  }
}
