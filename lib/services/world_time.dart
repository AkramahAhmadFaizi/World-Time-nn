import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late DateTime datetime;
  late String time;
  String url;

  WorldTime(this.url);

  Future<void> getTime() async{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    datetime = DateTime.parse(data['datetime']);
    time = DateFormat.jm().format(datetime);
  }

}