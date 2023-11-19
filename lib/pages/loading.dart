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

  void SetupWorldTime() async {
    WorldTime instance= WorldTime('Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {'time': instance.time, 'isDaytime': instance.isDayTime});
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
