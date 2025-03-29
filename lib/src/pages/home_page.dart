import 'package:flutter/material.dart';
import 'package:interapp/src/pages/products_page.dart';
import 'package:interapp/src/providers/appstate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer<AppState>(
        builder: (context,provider,_){
          final products = provider.products;
          return ProductsPage(products: products);
        })      
    );
  }
}