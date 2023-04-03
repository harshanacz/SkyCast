import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({super.key, this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

// print(
//     "The temperature in $city is $temperature degrees Celsius and the weather is $description.");

class _LocationScreenState extends State<LocationScreen> {
  late int temp;
  late String des;
  late String cityName;

  @override
  void initState() {
    super.initState();
    updateWithData(widget.locationWeather);
  }

  void updateWithData(dynamic weatherData) async {
    temp = weatherData["main"]["temp"].toInt();
    des = weatherData["weather"][0]["description"];
    cityName = weatherData["name"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: TextStyle(fontSize: 60),
                    ),
                    Text(
                      '☀️',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's $des in $cityName!",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
