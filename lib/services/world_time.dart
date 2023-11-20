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
    DateTime datetime = DateTime.parse(data['datetime']);
    isDayTime = datetime.hour > 7 && datetime.hour < 19 ? true : false;
    time = DateFormat.jm().format(datetime);
  }

}