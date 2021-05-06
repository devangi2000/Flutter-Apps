import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'berlin.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'cairo.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'nairobi.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'chicago.jpg'),
    WorldTime(
        url: 'America/New_York', location: 'New York', flag: 'newyork.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'seoul.jpg'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'kolkata.jpg'),
  ];

  // @override
  // void initState() {
  //   super.initState();
  // }

  void updateTime(index) async {
    WorldTime obj = locations[index];
    await obj.getTime();
    // navigate to home screen and pass the data we get from getTime() to
    // the home screen as well as the rest of the data like flag, isDaytime, etc.
    Navigator.pop(context, {
      'location': obj.location,
      'flag': obj.flag,
      'time': obj.time,
      'isDaytime': obj.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build function ran,');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:
          // RaisedButton(
          //   onPressed: () {
          //     setState(() {
          //       counter += 1;
          //     });
          //   },
          //   child: Text('counter: $counter'),
          // ),
          ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        // print(locations[index].location);
                        updateTime(index);
                      },
                      title: Text(locations[index].location),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/${locations[index].flag}'),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
