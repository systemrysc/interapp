import 'package:flutter/material.dart';
import 'package:interapp/src/app.dart';
import 'package:interapp/src/providers/appstate.dart';
import 'package:provider/provider.dart';

//{}
//[]

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(), 
      child: MyApp()),
  );
}
