import 'package:flutter/material.dart';
import 'package:worldtime/service/world_yime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setup_world_time() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'algeria.png', url: 'Europe/Berlin');
    await instance.getTime();
    // print(instance.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isdaytime' : instance.isDayTime,
    });
  }

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup_world_time();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: SpinKitFoldingCube(
            color: Colors.blue[500],
            size: 80.0,
          ),
        ),
      )
    );
  }
}