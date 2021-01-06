import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage = data['isdaytime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isdaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(onPressed: () async {
               dynamic res = await Navigator.pushNamed(context, '/locations');
               setState(() {
                 data = {
                   'time' : res['time'],
                   'location' : res['location'],
                   'flag' : res['flag'],
                   'isdaytime' : res['isdaytime']
                 };
               });
              }, icon: Icon(Icons.edit_location, color: Colors.grey[300]), label: Text('Edit location', style: TextStyle(color: Colors.grey[300]),)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['location'], style: TextStyle(fontSize: 28, letterSpacing: 2, color: Colors.white),)
                ],
              ),
              SizedBox(height : 20),
              Text(data['time'], style: TextStyle(fontSize: 60, color: Colors.white),),
            ],
          ),
      ),
        )),
    );
  }
}