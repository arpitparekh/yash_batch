import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

/*

 */

void main() {
  runApp(WeatherApplication());
}

class WeatherApplication extends StatelessWidget {
  const WeatherApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    // TODO: implement initState
    _determinePosition().then(
        (position) => {print("${position.latitude} ${position.longitude}")});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
          child: FutureBuilder(
        future: _determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: Text(
                    "Latitude :\n${snapshot.data?.latitude.toString()}\nLongitude:\n${snapshot.data?.longitude.toString()}"));
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      )),
    );
  }
}

// create a permission function
// void checkPermission() async{
//   var status = Permission.location;
//   if (await status.isDenied) {
//
//     if (await Permission.location.request().isGranted) {
//       print("Permission Grandted");
//     }else{
//       print("Please Grant permission");
//     }
//
//   }
//
// // You can also directly ask permission about its status.
//   if (await Permission.location.isRestricted) {
//     // The OS restricts access, for example, because of parental controls.
//   }
// }

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
