import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Time",
      theme: ThemeData(
          primarySwatch:
          Colors.blue
      ),
      home: Homepage(),
    );
  }
}


class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}
//hai
class _HomepageState extends State<Homepage>
{
  int hour=0;
  int min=0;
  int sec=0;
  bool started = true;
  bool stopped = true;
  int timefortimer = 0;
  String timetodisplay = "";



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('time project'),

      ),
      body: timer(),

    );
  }

  void start()
  {
    timefortimer = (hour*60*60) + (min *60) + sec;
    Timer.periodic(Duration(
      seconds: 1,
    ), (Timer t)  {
      if(timefortimer < 1){
        t.cancel();
      }
      else{
        timefortimer= timefortimer-1;
      }
      setState(() {
        timetodisplay = timefortimer.toString();
      });
    });
  }

  void stop(){

  }

  Widget timer(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text('HR'),
                    ),
                    NumberPicker.integer(
                        initialValue: hour,
                        minValue: 0,
                        maxValue: 23,
                        listViewWidth:  60.0,
                        onChanged: (val)
                        { setState(() {hour=val;});
                        }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text('HR'),
                    ),
                    NumberPicker.integer(
                        initialValue: min,
                        minValue: 0,
                        maxValue: 23,
                        listViewWidth:  60.0,
                        onChanged: (val)
                        { setState(() {min=val;});
                        }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text('HR'),
                    ),
                    NumberPicker.integer(
                        initialValue: sec,
                        minValue: 0,
                        maxValue: 23,
                        listViewWidth:  60.0,
                        onChanged: (val)
                        { setState(() {sec=val;});
                        }),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Text(
                timetodisplay,
                style:TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w600,
                )
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: started ? start : null,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.green,
                  child:
                  Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                RaisedButton(
                  onPressed: stopped ? stop : null ,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.red,
                  child: Text(
                    "Stop",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),)
              ],
            ),
          ) ,
        ],
      ),

    );
  }


}