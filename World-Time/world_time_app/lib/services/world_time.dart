import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag; //url to an asset flag icon
  String url; //location url for API endpoint
  String temp;

  bool isDaytime;
  WorldTime({this.location, this.flag, this.url});
  //WorldTime();
  Future<void> getTime() async {
    try {
      temp = 'http://worldtimeapi.org/api/timezone/$url';
      //Uri r = Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
      Uri r = Uri.parse(temp);
      Response response = await get(r);
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);

      // time = now.toString();
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'Error: $e';
    }

    // set time property
  }
}
