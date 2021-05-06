import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time = 'loading';

  void setUpWorldTime() async {
    WorldTime obj =
        WorldTime(location: 'Kolkata', flag: 'stars.png', url: 'Asia/Kolkata');
    await obj.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': obj.location,
      'flag': obj.flag,
      'time': obj.time,
      'isDaytime': obj.isDaytime,
    });
    //print(obj.time);
    //setState(() {
    //  time = obj.time;
    //});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
