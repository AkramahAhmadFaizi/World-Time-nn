import 'package:flutter/material.dart';
import 'package:world_time_nn/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  WorldTime instance= WorldTime('Europe/Berlin');
  String time = 'loading Screen...';

  void SetupWorldTime() async {
    await instance.getTime();
    setState(() {
      time = instance.time.toString();
    });
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
        child: Text('$time'),
      ),
    );
  }
}
