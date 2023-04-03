import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_getter/screens/loading/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late String lat;
  late String longs;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLoc();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    var lat = 37.7749; // San Francisco's latitude
    var lon = -122.4194; // San Francisco's longitude
    var part = "minutely"; // Exclude the minutely data
    var apiKey = "34be85e0299cc401d450c2bdb02d28f3";
    var response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/lat={$lat}&lon={$lon}&exclude={$part}&appid=$apiKey"));

    // Response response = await get(
    //     "https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid=34be85e0299cc401d450c2bdb02d28f3"
    //        );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(child: Text("fddf")),
    );
  }
}
