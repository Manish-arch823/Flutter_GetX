import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/models/product_models.dart';

class ApiServiceproduct {
  static var client = http.Client();
  static Future<List<ProductModel>> fetchProducts() async {
    // var response = await client.get(
    //     'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie');

    final response = await http.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    } else {
      Get.snackbar("Error loading data",
          "Server responded ${response.statusCode}:${response.reasonPhrase.toString()}");
    }
    return productModelFromJson("jsonString");
  }
}
