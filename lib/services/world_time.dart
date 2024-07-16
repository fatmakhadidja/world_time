import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String location='';  // location name for the UI
  String time='';      // the time in that location
  String flag='';      // url to an asset flag icon
  String url='';       // location url for API endpoint
  late bool isDaytime;

  WorldTime({this.location='',this.flag='',this.url=''});

   Future <void> getTime() async {

     try {
       // API endpoint
       Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

       // Decode the JSON response if status code is 200 (OK)
       Map data = jsonDecode(response.body);

       // get properties from data
       String dateTime = data['datetime'];
       String offset = data['utc_offset'].substring(1,3);

       // print(dateTime);
       // print(offset);

       // create a date time object
       DateTime now = DateTime.parse(dateTime);
       now = now.add(Duration(hours: int.parse(offset) ));

       // set the time property
       isDaytime=( now.hour > 6 && now.hour <20 )? true : false;
       time = DateFormat.jm().format(now);
     }
     catch(e){
         print('$e');
     }



  }
 }

