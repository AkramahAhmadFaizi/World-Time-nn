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
    data = data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: data['isDayTime'] ? AssetImage('assets/day.png') : AssetImage('assets/night.png'),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.0,),
              TextButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data= {
                      'time': result['time'],
                      'location': result['location'],
                      'flag': result['flag'],
                      'isDayTime': result['isDayTime'],
                    };
                  });
                },
                icon: Icon(Icons.edit_location, color: Colors.white,),
                label: Text('Edit Location', style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${data['location']}',
                    style: TextStyle(fontSize: 30.0, letterSpacing: 2.0, color: Colors.white),),
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                '${data['time']}', style: TextStyle(fontSize: 60.0, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
