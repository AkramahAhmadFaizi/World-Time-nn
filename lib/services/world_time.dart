import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String time;
  late String location;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime({required this.url, required this.location, required this.flag});

  Future<void> getTime() async{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    String str = data['datetime'];
    DateTime datetime = DateTime.parse(str.substring(0, str.length - 6));
    isDayTime = datetime.hour > 7 && datetime.hour < 19 ? true : false;
    time = DateFormat.jm().format(datetime);
  }

}