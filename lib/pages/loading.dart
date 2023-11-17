import 'package:flutter/material.dart';
import 'package:world_time_nn/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void SetupWorldTime() async {
    WorldTime instance= WorldTime('Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: instance.time);
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
        child: SafeArea(child: Text('Loading... ')),
      ),
    );
  }
}
