import 'package:flutter/material.dart';
import 'package:interapp/src/models/products.dart';
import 'package:interapp/src/services/products_services.dart';

class AppState with ChangeNotifier {
  final List<Products> _products = [];
  List<Products> get products => _products;
  bool isLoading = false;
  bool isStopLoad = false;
  double position =0;
   
  
  AppState(){
    loadProducts();
  }


  loadProducts() async {
    
    if (isStopLoad){
      return;
    }

    if (isLoading){
      return;
    }

    try {
      isLoading=true;
      final data = await fetchProducts(_products.length);
      
      if (data.isEmpty){
        isStopLoad=!isStopLoad;
      }

      _products.addAll(data);
      isLoading=!isLoading;
      notifyListeners();

    } catch (e) {
      throw Exception('Failed load products, $e');
    }
  }


}
