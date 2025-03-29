import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:interapp/src/models/products.dart';
import 'package:http/http.dart' as http;

List<Products> parseProducts(String response) {
  try {
    List jsonResponse = json.decode(response)["products"];

    return jsonResponse.map((product) => Products.fromJson(product)).toList();
  } catch (e) {
    throw Exception(e);
  }
}

Future<List<Products>> fetchProducts(int skip) async {
  try {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products?limit=10&skip=$skip"),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed load products");
    }
    return compute(parseProducts, response.body);
  } catch (e) {
    throw Exception("Faile load products, $e");
  }
}
