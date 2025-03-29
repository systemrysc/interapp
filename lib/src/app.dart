import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interapp/src/pages/home_page.dart';
import 'package:interapp/src/pages/products_details_page.dart';

final _route = GoRouter(
  initialLocation: '/',
  routes: [
  GoRoute(
    path: '/',    
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path:'/products',
    builder:(context, state)=>ProductsDetailsPage()
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Products',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      routerConfig: _route,
    );
  }
}

