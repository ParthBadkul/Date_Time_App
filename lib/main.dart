import 'package:app3/screens/choose_location.dart';
import 'package:flutter/material.dart';
import 'package:app3/screens/home.dart';
import 'package:app3/screens/loading.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp(MaterialApp(
    // home: Home(),
    // initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location(),
    },
  ));
}
