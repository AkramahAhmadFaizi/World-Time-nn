import 'package:flutter/material.dart';
import 'package:world_time_nn/pages/home.dart';
import 'package:world_time_nn/pages/loading.dart';
import 'package:world_time_nn/pages/location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/loading': (context) => Loading(),
      '/location': (context) => Location(),
    },
  ));
}