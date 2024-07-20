import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Safely access arguments
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      data = data.isNotEmpty ? data : args ;
    }
    print(data);

    // set background
    Color bgcolor = data['isDaytime'] ? Color(0xFF71AFC7) : Color(0xFF131638);


    return Scaffold(
      backgroundColor: bgcolor,
      body: Container(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
            child: Column(
              children : [
                ElevatedButton.icon(
                  onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = {
                       'time' : result['time'],
                       'location' : result['location'],
                       'flag' : result['flag'],
                       'isDaytime' : result ['isDaytime']
                     };
                   });

                  },
                  icon: Icon(Icons.location_on),
                  label: Text('Edit location'),

                ),
                SizedBox(height: 30),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                        color: Colors.white
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style : TextStyle (
                    fontSize: 66,
                      color: Colors.white
                  ),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
