import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl_browser.dart';
// ...
// findSystemLocale().then(runTheRestOfMyProgram);

class Datetime {
  late String time;
  late String url;
  late String loction;
  late bool dayTime;
  late String flag;

  Datetime({required this.loction, required this.url, required this.flag});

  Future<void> getTime() async {
    try {
      Response reponse =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      // print(reponse.body);
      Map decode = jsonDecode(reponse.body);
      String dateTime = decode['utc_datetime'];
      String offet = decode['utc_offset'];
      offet = offet.substring(1, 3);
      // print(dateTime);
      // print(offet);
      DateTime date = DateTime.parse(dateTime);
      // print(date);
      // if (date.hour > 6 && date.hour < 20) {
      //   dayTime = true;
      // } else {
      //   dayTime = false;
      // }
      date.hour > 6 && date.hour < 18 ? dayTime = true : dayTime = false;
      print(date.hour);
      date = date.add(Duration(hours: int.parse(offet)));
      time = DateFormat.jm().format(date);
      print(time);
    } catch (e) {
      // print(e);

      time = 'Error Loading Time';
    }
  }
}

// void main(List<String> args) {
//   Datetime ins = Datetime(loction: 'Africa/Abidjan', url: 'Africa/Abidjan');
//   ins.getTime();
// }
