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
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body:  SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/night.png'),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.0,),
              TextButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Berlin',
                    style: TextStyle(fontSize: 30.0, letterSpacing: 2.0),),
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                '${data['time']}', style: TextStyle(fontSize: 60.0,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
