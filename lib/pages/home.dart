import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String time ='';
  @override
  Widget build(BuildContext context) {
    time = ModalRoute.of(context)!.settings.arguments as String;
    print(time);
    return Scaffold(
      body:  SafeArea(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Berlin',
                  style: TextStyle(fontSize: 30.0),),
              ],
            ),
            SizedBox(height: 20.0,),
            Text(
              '$time', style: TextStyle(fontSize: 60.0,),
            )
          ],
        ),
      ),
    );
  }
}
