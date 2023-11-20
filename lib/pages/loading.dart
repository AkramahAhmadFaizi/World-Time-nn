import 'package:flutter/material.dart';
import 'package:world_time_nn/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void SetupWorldTime() async {
    WorldTime instance= WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(
        context, '/home',
        arguments: {
          'time': instance.time,
          'location': instance.location,
          'flag': instance.flag,
          'isDayTime': instance.isDayTime
        }
    );
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SetupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
