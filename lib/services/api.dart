import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class Api {
  static const baseUrl = "http://youripadress/api/";

  static addProduct(Map pData) async {
    print(pData);
    var url = Uri.parse("${baseUrl}products");
    try {
      final res = await http.post(url, body: pData);
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body.toString());
        print(data.toString());
      } else {
        print('failed to get response from server');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getProduct() async {
    List<ProductModel> products = [];
    var url = Uri.parse("${baseUrl}getProduct");
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());

        // Debug print to check the received data
        print("Data received: $data");

        // Assuming the response is a list of products
        // Adjust the iteration based on the actual structure of your response
        for (var value in data) {
          // If data is a list
          products.add(ProductModel(
              id: value['id'], // Should be a String
              name: value['pname'],
              price: value['pprice'],
              description: value['pdesc']));
        }

        // Return the products list
        return products;
      } else {
        print('Failed to get response from server: ${res.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

//update api

  static updateProductApi(id, body) async {
    var url = Uri.parse("${baseUrl}update/$id");

    final res = await http.put(url, body: body);

    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print('failed to update data');
    }
  }

  //delete api

  static deleteProductApi(id) async {
    var url = Uri.parse("${baseUrl}deleteProduct/$id");

    final res = await http.delete(url);
    if (res.statusCode == 200) {
      print('Product deleted successfully');
    } else {
      print('failed to delete data');
    }
  }
}
