import 'package:flutter/material.dart';
import 'package:world_time_nn/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Patna', flag: 'indonesia.png')
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(
                leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}')),
                title: Text(locations[index].location, style: TextStyle(letterSpacing: 0.6),),
                onTap: () async {
                  WorldTime instance = locations[index];
                  await instance.getTime();
                  Navigator.pop(context, {
                    'time': instance.time,
                    'flag': instance.flag,
                    'isDayTime': instance.isDayTime,
                    'location': instance.location,
                  });
                },
              )
              // Row(
              //   children: [
              //     CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}'),),
              //     SizedBox(width: 5.0,),
              //     Text(locations[index].location, style: TextStyle(letterSpacing: 0.6),)
              //   ],
              // ),
            )
          );
        },
      ),
    );
  }
}
