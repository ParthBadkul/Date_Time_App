// import 'dart:convert';
// ignore_for_file: prefer_const_constructors
import 'package:app3/services/date_time.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String data = 'Loading';
  void getdate() async {
    Datetime ins = Datetime(
        loction: 'Africa/Abidjan', url: 'Africa/Abidjan', flag: 'Africa.png');
    // print(ins.time);
    await ins.getTime();
    // print(ins.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'Location': ins.loction,
      'Time': ins.time,
      'Daytime': ins.dayTime,
      'Flag': ins.flag
    });
  }

  @override
  int count = 0;
  void initState() {
    // TODO: implement initState
    super.initState();
    getdate();
  }

  @override
  Widget build(BuildContext context) {
    // print(' Setstae vala + $count');
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitDualRing(
            color: Color.fromARGB(255, 246, 241, 241),
            size: 50,
          ),
        ));
  }
}
