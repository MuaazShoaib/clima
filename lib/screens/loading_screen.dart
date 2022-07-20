import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // getLocation();
    // getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    // print(location.latitude);
    // print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(
      Uri.parse(
          // Islamabad Location
          'https://api.openweathermap.org/data/2.5/weather?lat=33.684422&lon=73.047882&appid=a43896ce1a975826c5dbee925e9418f9'),

      //   Uri.parse(
      //       'https://api.openweathermap.org/data/2.5/heather?lat=35&lon=139&appid=a43896ce1a975826c5dbee925e9418f9'),
    );

    // print(response.body);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);

      // var longitute = jsonDecode(data)['coord']['lon'];
      // print(longitute);
      //
      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      // print(weatherDescription);
      //
      // // weather[0].description

      var decodedData = jsonDecode(data);

      // var temperature = jsonDecode(data)['main']['temp'];
      // var cityName = jsonDecode(data)['name'];
      // var condition = jsonDecode(data)['weather'][0]['id'];

      // var temperature = decodedData['main']['temp'];
      // var cityName = decodedData['name'];
      // var condition = decodedData['weather'][0]['id'];

      double temperature = decodedData['main']['temp'];
      String cityName = decodedData['name'];
      int condition = decodedData['weather'][0]['id'];

      print(temperature);
      print(cityName);
      print(condition);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
