import 'package:flutter/material.dart';
import 'package:world_time_nn/pages/home.dart';
import 'package:world_time_nn/pages/loading.dart';
import 'package:world_time_nn/pages/location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location(),
    },
  ));
}