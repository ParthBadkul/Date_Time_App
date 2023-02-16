// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:app3/services/date_time.dart';
import 'package:app3/screens/loading.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<Datetime> l = [
    Datetime(url: 'Europe/London', loction: 'London', flag: 'uk.png'),
    Datetime(url: 'Europe/Berlin', loction: 'Athens', flag: 'greece.png'),
    Datetime(url: 'Africa/Cairo', loction: 'Cairo', flag: 'egypt.png'),
    Datetime(url: 'Africa/Nairobi', loction: 'Nairobi', flag: 'kenya.png'),
    Datetime(url: 'America/Chicago', loction: 'Chicago', flag: 'usa.png'),
    Datetime(url: 'America/New_York', loction: 'New York', flag: 'usa.png'),
    Datetime(url: 'Asia/Seoul', loction: 'Seoul', flag: 'south_korea.png'),
    Datetime(url: 'Asia/Jakarta', loction: 'Jakarta', flag: 'indonesia.png'),
    Datetime(loction: 'India', url: 'Asia/Kolkata', flag: 'india.png')
  ];

  void updateTime(index) async {
    Datetime inst = l[index];
    await inst.getTime();
    Navigator.pop(context, {
      'Location': inst.loction,
      'Time': inst.time,
      'Daytime': inst.dayTime,
      'Flag': inst.flag
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 184, 171),
        title: Text("Choose Loaction"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: l.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(l[index].loction),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('lib/assets/${l[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
