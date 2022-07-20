import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = 'a43896ce1a975826c5dbee925e9418f9';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    // getData();
  }

  // void getData() async {
  // http.Response response = await http.get(
  //   Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'),
  // );
  //
  // if (response.statusCode == 200) {
  //   String data = response.body;
  //
  //   var decodedData = jsonDecode(data);
  //
  //   double temperature = decodedData['main']['temp'];
  //   String cityName = decodedData['name'];
  //   int condition = decodedData['weather'][0]['id'];
  //
  //   print(temperature);
  //   print(cityName);
  //   print(condition);
  // } else {
  //   print(response.statusCode);
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
