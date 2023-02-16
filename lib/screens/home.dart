// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map : data;
    // print(data['Daytime'].toString() == 'true');
    // String com = data['DayTime'].toString();
    // print(com);
    print(data['Daytime'].toString() == 'true');
    return data['Daytime'].toString() == 'true'
        ? Scaffold(
            backgroundColor: Colors.grey[400],
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 80, 20, 5),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text('Home'),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['Location'],
                          style: TextStyle(fontSize: 20, letterSpacing: 5.90),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      data['Time'],
                      style: TextStyle(
                          fontSize: 48,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          icon: Icon(
                            Icons.replay_outlined,
                            color: Color.fromARGB(255, 28, 27, 27),
                          ),
                          label: Text(
                            'Reload',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () async {
                            dynamic result =
                                await Navigator.pushNamed(context, '/location');
                            setState(() {
                              data = {
                                'Time': result['Time'],
                                'Location': result['Location'],
                                'Daytime': result['Daytime'],
                                'Flag': result['Flag']
                              };
                            });
                          },
                          label: Text('Choose Location'),
                          icon: Icon(Icons.location_city_outlined),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))
        : Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 80, 20, 5),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text('Home'),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['Location'],
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 5.90,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      data['Time'],
                      style: TextStyle(
                          fontSize: 48,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: Icon(Icons.replay_outlined),
                      label: Text('Reload'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'Time': result['Time'],
                            'Location': result['Location'],
                            'Daytime': result['Daytime'],
                            'Flag': result['Flag']
                          };
                        });
                      },
                      label: Text('Choose Location'),
                      icon: Icon(Icons.location_city_outlined),
                    )
                  ],
                ),
              ),
            ));
  }
}
