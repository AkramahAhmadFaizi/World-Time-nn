import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late DateTime time;
  String url;

  WorldTime(this.url);

  Future<void> getTime() async{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    time = DateTime.parse(data['datetime']);
  }

}