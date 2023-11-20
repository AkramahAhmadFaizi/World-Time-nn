import 'package:flutter/material.dart';
import 'package:world_time_nn/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  final spinkit = SpinKitRotatingCircle(
    color: Colors.white,
    size: 50.0,
  );
  Map data={};

  void SetupWorldTime(url, location, flag) async {
    WorldTime instance= WorldTime(url: url, location: location, flag: flag);
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
    SetupWorldTime('Europe/Berlin', 'Athens', 'greece.png');
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    SetupWorldTime(data['url'], data['location'], data['flag']);
    return Scaffold(
      body: ElevatedButton(
        onPressed: (){},
        child: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
          ),
        )
      ),
    );
  }
}
